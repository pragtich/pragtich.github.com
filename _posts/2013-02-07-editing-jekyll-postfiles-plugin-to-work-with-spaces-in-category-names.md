---
layout: post
title: "Editing jekyll postfiles plugin to work with spaces in category names"
category: Blogging
tags: []
indeximage: 
comment_id: postfiles-spaces
summary: "I edited the postfiles plugin to work with category names containing special characters (especially spaces)."
---

I use [the postfiles plugin by André Arko](https://github.com/indirect/jekyll-postfiles) to add static files to the posts that I write. It is a great addition, because it allows to group the static files together with the post in a sensible way (although I still find myself searching for the correct folder name, and have added a rake task to make it easier to find, may blog on it later). However, I noticed a few issues in my blog, that has category names that include spaces. I assume that the same error occurs in other special characters, that get `CGI.escape`d during processing by Jekyll.

# The Cause (1/2)

In the [Jekyll source](https://github.com/mojombo/jekyll/tree/master/lib/jekyll), each of the file types (Post, Page and StaticFile) have a `write` method, that in turn calls `destination` to calculate the correct file/folder name. I guess it is by design that the `StaticFile` version uses the filenames verbatim, while `Post` and `Page` do some unescaping. I assume this was done because a static file typically has no Category, so will simply get its place in the filesystem under `_site` without needing processing. In the `postfiles` case, though, we are working with `CGI.encode`d folder names because they were generated from the processing of the matching post.

The lack of unescaping causes a `StaticFile` that contains a special character in its category to have a path that contains a percent sign. For example, the category `Computer stuff` will end up in the folder `_site/Computer stuff`, but the `post.url` will contain the string `Computer%20stuff`. This ends up being a folder that the server cannot find, because it is uncoding the `%20` again, to a space.

# The Cause (2/2)

In [the jekyll-postfiles plugin](https://github.com/indirect/jekyll-postfiles), there is a regexp that splits out the parts of the post id, to form the folder name where it searches for the postfiles. This regexp uses `[\s\w\/]*` to parse away the leading path details. This chokes on the `CGI.encode`d paths, because the word characters `\w` do not match the percent sign `%`. This leads to the leading part of the path not matching the regexp, thus generating incorrect paths.

# The solutions

Easy. Add percent to the pathname regexp:

	{% highlight ruby %}
	postfile_id = post.id.gsub(/[\s\w\/%]*(\d{4})\/(\d\d)\/(\d\d)\/(.*)/, '\1-\2-\3-\4')
	{% endhighlight %}

and `CGI.decode` the directory portion of the filename before passing it back to Jekyll:

	{% highlight ruby %}
      # Add a static file entry for each postfile, if any
        Dir[File.join(postfile_dir, '/*')].each do |pf| 
          site.static_files << PostFile.new(site, postfile_dir, CGI.unescape(post.url), File.basename(pf))
        end
	{% endhighlight %}

