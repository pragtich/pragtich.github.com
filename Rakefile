require 'rake'
require 'yaml'
require 'time'
require 'highline/import'


SOURCE = "."
CONFIG = {
  'layouts' => File.join(SOURCE, "_layouts"),
  'posts' => File.join(SOURCE, "_posts"),
  'postfiles' => File.join(SOURCE, "_postfiles"),
  'site' => File.join(SOURCE, "_site"),
  'post_ext' => "md",
  'site_url' => "http://pragti.ch"
}

#Import all rakefiles from _rake folders
Dir.glob('_rake/*.rake').each { |r| Rake.application.add_import (r) }


EDITOR= ENV['VISUAL'] || ENV['EDITOR'] 


# Usage: rake postfile [title="search string"]
desc "Creates a  postfiles folder for a specific post (selected by title (filename) substring search and choose menu, or the latest one if no title given)"
task :postfile do
  abort("rake aborted: '#{CONFIG['postfiles']}' directory not found.") unless FileTest.directory?(CONFIG['postfiles'])
  
searchstring = ENV["title"] || Time.now.strftime('%Y-%m-%d')
  myfiles = Dir["#{CONFIG['posts']}/*.#{CONFIG['post_ext']}"]
  myfiles.map {|s| s.gsub!(/\.#{Regexp.quote(CONFIG['post_ext'])}$/, '')}
  myfiles.map {|s| s.gsub!(/^#{Regexp.quote(CONFIG['posts'])}\//, '')}
  myfiles.select! {|s| s.include?(searchstring)}
#  puts "My files: #{myfiles}"
#  puts myfiles.class
#  puts "Count: #{myfiles.count}"
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


# Usage: rake post title="A Title" [date="2012-02-09"]
desc "Begin a new post in #{CONFIG['posts']}"
task :post do
  abort("rake aborted: '#{CONFIG['posts']}' directory not found.") unless FileTest.directory?(CONFIG['posts'])
  title = ENV["title"] || "new-post"
  slug = title.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  begin
    date = (ENV['date'] ? Time.parse(ENV['date']) : Time.now).strftime('%Y-%m-%d')
  rescue Exception => e
    puts "Error - date format must be YYYY-MM-DD, please check you typed it correctly!"
    exit -1
  end
  filename = File.join(CONFIG['posts'], "#{date}-#{slug}.#{CONFIG['post_ext']}")
  if File.exist?(filename)
    abort("rake aborted!") if ask("#{filename} already exists. Do you want to overwrite?", ['y', 'n']) == 'n'
  end
  
  puts "Creating new post: #{filename}"
  open(filename, 'w') do |post|
    post.puts "---"
    post.puts "layout: post"
    post.puts "title: \"#{title.gsub(/-/,' ')}\""
    post.puts "category: "
    post.puts "tags: []"
    post.puts "indeximage: "
    post.puts "comment_id: "
    post.puts "summary: \"\""
    post.puts "---"
  end

  puts "editor: #{EDITOR}"
  system( "#{EDITOR} #{filename}") if EDITOR
end # task :post


# Usage: rake page name="about.html"
# You can also specify a sub-directory path.
# If you don't specify a file extention we create an index.html at the path specified
desc "Create a new page."
task :page do
  name = ENV["name"] || "new-page.md"
  filename = File.join(SOURCE, "#{name}")
  filename = File.join(filename, "index.html") if File.extname(filename) == ""
  title = File.basename(filename, File.extname(filename)).gsub(/[\W\_]/, " ").gsub(/\b\w/){$&.upcase}
  if File.exist?(filename)
    abort("rake aborted!") if ask("#{filename} already exists. Do you want to overwrite?", ['y', 'n']) == 'n'
  end
  
  mkdir_p File.dirname(filename)
  puts "Creating new page: #{filename}"
  open(filename, 'w') do |post|
    post.puts "---"
    post.puts "layout: page"
    post.puts "title: \"#{title}\""
    post.puts 'description: ""'
    post.puts "---"
    post.puts "{% include JB/setup %}"
  end
end # task :page

desc "Launch preview environment"
task :preview do
  system "ejekyll  serve --watch"
end # task :preview

desc "Compile using ejekyll"
task :compile do
  system "ejekyll build"
end # task :preview




