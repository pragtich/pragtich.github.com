---
layout: post
title: "Migrating from nanoc to jekyll"
summary: "I started a blog (this blog) using Nanoc last year, as a method to learn Ruby. Although it is great, especially because it allows complete control, my Ruby skills are not up to nanoc. I kept on getting stuck doing programming myself, and fighting all kinds of bugs. This is the log of an attempt to reduce complexity by switching to Jekyll"
category: Blogging
tags: []
indeximage: jekyll.jpg
comment_id: nanoc_to_jekyll
---

# Introduction

I had started with a website/blog last year [and even took the effort to host it](http://pragti.ch/) and enjoy the experience. Especially getting feedback in the comments, and learning that others are enjoying my notes, is great fun. I had started using `nanoc` [(here)](http://nanoc.ws/) as a generator for the site. It's great, because it allows you to generate a static site from a set of source files. I love this, because it meets many of my criteria for a blogging engine:

- Static generation. Why waste server power generating a page on every view when it actually hardly changes?
- Modularity. Split form and content as much as possible.
- Flexibility. Ability to adapt to my wishes.
- Fun. Learn something new.

Now, I am moving away from `nanoc`, and switching to `jekyll`. Why? Because `nanoc` is a little too complex for my taste. It can just do too much, and requires serious `ruby` skills. `Jekyll` is simpler, really made for much more simple blogging tasks that `nanoc` is. After plugins and extensions have been added, the flexibility is good and the simplicity is still great.

# Setting up Jekyll

Setting up `jekyll` is easy. Just follow [the instructions on the jekyll site](https://github.com/mojombo/jekyll/wiki/install), as easy as:

    gem install jekyll
	
Note that I later switched to extended jekyll, see below.

[The documentation for `jekyll`](http://jekyllrb.com/) is good, although structure is a bit lacking. If you read through this, it will be much clearer. Especially useful is studying the [Liquid documentation](http://wiki.github.com/shopify/liquid/liquid-for-designers) and the [Jekyll Liquid extensions](https://github.com/mojombo/jekyll/wiki/Liquid-Extensions).

Configuring happens through `_config.yml`, and I have the following in there:

	permalink: pretty      # Required for the postfiles plugin
	lsi: true              # Will be useful for related pages later on
	markdown: kramdown     # I like kramdown


# Switching to Jekyll_ext

In order to be able to extend `jekyll` with stuff that will allow me to use Haml and Sass, I installed `jekyll_ext` [from github](https://github.com/indirect/jekyll-postfiles). Although I do call `ejekyll` instead of `jekyll` already, I am not at present using any of its functionality yet.

# Adding jekyll-postfiles

One of the big troubles with `jekyll` is that it does not have any concept of files that belong together with a post as a logical unit. This could mainly be relevant for images, but also stuff like downloads. I had started with one central subfolder in the jekyll folder. That works, but means that each post needs to link to this one folder, and that all the images are going to run together into one folder. 

This is solved by [the `jekyll-postfiles` plugin](https://github.com/indirect/jekyll-postfiles) by Andre Arko. Check it out. What it does, is allow you to put the files belonging to a post in the `_postfiles/` folder, in a subfolder named like the post itself. So, the post `_posts/2012-12-31-Test.md` would have a matching folder `_postfiles/2012-12-31-Test/` where the matching files can be put.

Also, it gives you a Liquid tag that allows you access to the files from your post without needing to know where exactly the files are. It works like this:

    {% raw %}
	{% postfile file.zip %}
	{% endraw %}

[Check it out!](https://github.com/indirect/jekyll-postfiles)


# Using Haml and Sass

Using Haml and Sass needs plugins that can get closely involved in the generation process. This cannot be done with the standard `jekyll` plugins. There is another extension mechanism that can do it: [`jekyll_ext`](https://github.com/rfelix/jekyll_ext). I am not yet using the tools that are based upon this, but will do in the future. I love Haml and Sass.

# Migrating the layouts

I have several layouts in the site, and they turned out to need only small changes. Mainly, adjusting for a slightly changed folder structure and adding liquid tags instead of ERB code. All layouts except `default` have a YAML Front Matter that points to the `default` layout, which adds the navigation portion of the page and the whole HTML base of the page. 

## Layout: default

Adds the HTML boilerplate, CSS links and navigation to the site. Each page should end up passing through `default` last. Because it is last, it does not have a YAML Front Matter.

For navigation links, I changed the hardcoded URLS in the original to the following Liquid structure. That should allow switching from the test environment to the production environment URLs easily (not verified yet).

	{% raw %}
	<a href="{{ site.url }}/blog/index.html">Index of all articles</a> </li>
	{% endraw %}

Also, Jekyll gives you the opportunity to access all the categories and tags in the site, so the navigation bar content changed to something like this (makes use of the category pages generated by the plugin mentioned below):

	{% raw %}
	<H2>Categories</h2>
    <ul>
	  {% for cat in site.categories %}
	    <li>
		  <a href="{{ site.url }}/categories/{{ cat[0] | downcase | replace: ' ','-' | cgi_escape}}">{{ cat[0] }}</a>
		</li>
	   {{  }}
	  {% endfor %}
    </ul>
	{% endraw %}

## Layout: Index

The index layout is really simple. It is meant for the main blog index page only. All it does is wrap the page content in `<article>` tags and pass it on to `default`. Easy.

	{% raw %}
	---
	layout: default
	---
	<article>
	{{content}}  
	</article>
	{% endraw %}

## Layout: category_index

This layout is meant for the autogenerated category indes pages (see below). It again wraps the content in an `<article>` tag, and then it loops through all articles in this category to list them one by one. I want to reduce the redundancy between this one and the content of my main index page (which is very similar), but that will be future work.

This is the entire thing:
	
	{% raw %}
	---
	layout: default
	---
	<article>
	<h1 >{{ page.title }}</h1>
	<ul >
	{% for post in site.categories[page.category] %}
		<indextitle><a href="{{ post.url }}">{{ post.title }}</a>
		  {% if post.indeximage %}
		  <IMG SRC="{{ site.baseurl }}/indeximages/{{ post.indeximage }}"/>
		  {% endif %}

		  <h2 class="itemdate">{{ post.date | date_to_html_string }}
		  <BR>
		  Filed under {{ post.categories | category_links }}</h2>
		</indextitle>
		<summary>
		  {{ post.summary }}
		</summary>
	{% endfor %}
	</ul>
	</article>
	{% endraw %}

## Layout: post

This layout is used for all actual blog posts. It lays out each article, and adds some comment stuff below that. This is how it looks:

	{% raw %}
	---
	layout: default
	---
	<article>
	  <header>
		<hgroup>
		  {% if page.indeximage %}<img src="{{ site.url }}/indeximages/{{ page.indeximage }}">{% endif %}
		  <h1 class="itemtitle">{{ page.title }}</h1>
		  <h2 class="itemdate">{{ page.date | date_to_string }}</h2>
		</hgroup>
	  </header>
	  <summary>
	    {{ page.summary }}
	</summary>
	<bodytext>
	  {{ content }}
	<footer>
	  <p>
	  </p>
	  <div id="disqus_thread"></div>
		  .... Stuff from DISQUS ...
	  </a>
	</footer>
	</article>
	{% endraw %}
	
# Category navigation

In order to automatically generate category pages, I installed the plugin [from this website](http://recursive-design.com/projects/jekyll-plugins/). It works. That's what is creating the navigation bar contents, seen above. It does replace spaces in category names by hyphens, so the above code does that, too.

I did encounter an issue with special characters in the category names (most notably spaces). I have blogged about the fix [here]({% post_url 2013-02-07-editing-jekyll-postfiles-plugin-to-work-with-spaces-in-category-names %}).

A second issue, is that this creates lowercase category folder names, but my links in the navigation bar are with uppercase characters, too. So links break on the `github` server, because it is case sensitive where my OS X is not. That's why I added a `downcase` to the `Liquid` code in the `default` layout.

# Rakefile to make things more useable

The `postfiles` plugin is great, but I do not like the ergonomics of creating the folders. The names are long, and I need to recognize all of it. So, I wrote a rake task to perform the duty of creating the postfiles folder for a specific post.

Assuming that the user usually wants to add a postfile to today's post, the default behaviour is to make a folder for today's post if `rake postfile` is typed. In order to select another post, the user can search using `rake postfile title="searchtext"`. If several hits are found, a menu is shown.

This is the part of the [`Rakefile`](https://github.com/pragtich/pragtich-blog-jekyll/blob/master/Rakefile) that does this:

{% highlight ruby %}
 require 'rake'
 require 'yaml'
 require 'time'
 require 'highline/import'

 SOURCE = "."
 CONFIG = {
   'layouts' => File.join(SOURCE, "_layouts"),
   'posts' => File.join(SOURCE, "_posts"),
   'postfiles' => File.join(SOURCE, "_postfiles"),
   'post_ext' => "md"
 }
 # Usage: rake postfile [title="search string"]
 desc "Creates a  postfiles folder for a specific post (selected by title (filename) substring search and choose menu, or the latest one if no title given)"
 task :postfile do
   abort("rake aborted: '#{CONFIG['postfiles']}' directory not found.") unless FileTest.directory?(CONFIG['postfiles'])

 searchstring = ENV["title"] || Time.now.strftime('%Y-%m-%d')
   myfiles = Dir["#{CONFIG['posts']}/*.#{CONFIG['post_ext']}"]
   myfiles.map {|s| s.gsub!(/\.#{Regexp.quote(CONFIG['post_ext'])}$/, '')}
   myfiles.map {|s| s.gsub!(/^#{Regexp.quote(CONFIG['posts'])}\//, '')}
   myfiles.select! {|s| s.include?(searchstring)}
   abort("No file found. Please rake postfiles title=\"searchstring\" to indicate what you want or leave empty for today's files") if myfiles.count == 0 
   if myfiles.count == 1 then
	 mychoice = myfiles[0] 
   else
	 mychoice=choose do |menu|
	   menu.prompt = "Please choose which file to add a postfile folder to: "
	   menu.choice(:abort) {abort("You cancelled. Too bad.")}
	   myfiles.each { |file| menu.choice(file)}
	 end
   end
   puts "Chosen: #{mychoice}"
   thefolder = "#{CONFIG['postfiles']}/#{mychoice}"
   abort("Folder #{thefolder} already exists") if File.exists?(thefolder)

   puts "Making folder #{thefolder} for your postfiles."
   FileUtils.mkdir_p(thefolder)
 end # task :postfile
 {% endhighlight %}

Also, I stole parts of the `Rakefile` from [Jekyll-bootstrap](https://raw.github.com/plusjade/jekyll-bootstrap/master/Rakefile). Especially, the `post` and `preview` commands I really like. I did edit them to meet my tastes, please see [the file on GitHub](https://github.com/pragtich/pragtich-blog-jekyll/blob/source/Rakefile). 

# Migrating the posts

As I had only a few posts, I decided to migrate them by hand. This involved:

1. Moving the post file to the `_posts/` folder.
2. Renaming the file with the `yyyy-mm-dd-title.ext` pattern (I was previously using a `created_at` tag in the `YAML` of the post).
3. Adding `layout:post` to the YAML front matter.
3. Copying the images to the `_postfiles/` folder (using my rake helper) and updating the references to the new Liquid tag.
3. Copy any index images to the `indeximages/` folder.
4. Testing.



Even though it was only two handfuls of posts, this turned out to be a bit tedious. Especially going through all the files for the internal links and referencing them to the correct place was a drag.

# Old links

I have not found a way to keep my old links alive. Good thing I was giving DISQUS some unique IDs for the posts, at least that makes the comments still follow the posts to the new place. I could make dummy pages with redirects, but I am too lazy. This is not a high-traffic site, right?

# Deploying to github-pages

The [help for Github pages](https://help.github.com/categories/20/articles) is quite clear. The trick was to migrate from my original repo to the new one, them being completely separate before. I will probably go back to the strategy that I followed for `nanoc`.That is, to keep the source and output together in one repository with the `source` branch containing the source and the `master` branch containing the site itself. This does require some trickery in the `Rakefile`. A drawback is that this deployment can break if git is not happy switching branches, but has the benefit that all files are kept together in the repo so all history is kept together.

First, I created the correct branch structure:

    git checkout -b source
	git checkout master
	
Then, I remodel the master branch to contain only the files from the _site folder. I edit the README file to make clear what's going on. And I add a `.nojekyll` file to tell Github not to try and process it itself. Finally, I make sure that the new source folder gets pushed to the origin (Github).

	rm -rf xxxx yyyy zzzz         # all files except _site/ and README
	mv _site/* .
	rm -rf _site
	
	touch .nojekyll
	
	vi README
	
	git commit -A 
	git push -u origin source

Now, I need to come up with a Rakefile that does the correct processing, something like this:

1. Check that I am on the source branch, or fail.
2. Compile using `ejekyll` with the `--url` option set for the server url.
3. Checkout master

[Check out my latest Rakefile to check how I did it](https://github.com/pragtich/pragtich-blog-jekyll/blob/source/Rakefile). Specifically, I made a deployment sub-rakefile in the `_rake/` subfolder. [Check it out if you want](https://github.com/pragtich/pragtich-blog-jekyll/tree/source/_rake).
