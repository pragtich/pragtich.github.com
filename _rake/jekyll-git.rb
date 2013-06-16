require 'find'
require 'git'
require 'jekyll'

module JekyllGit
  module JekyllGit::Deploy
    class Git
      
      def initialize(config)
        error 'No site configuration found' unless File.file?('_config.yml')

        # Get configuration
        @jekyll_conf = Jekyll.configuration({})
        error 'Not able to read configuration from Jekyll' if @jekyll_conf.nil?

        # config to be gotten from the config file later; 
        @src_branch = @jekyll_conf['git']['source'] 
        @src_branch ||= 'source'
        @dst_branch = @jekyll_conf['git']['destination'] 
        @dst_branch ||= 'master'
        @dst_remote = @jekyll_conf['git']['remote'] 
        @dst_remote ||= 'origin'

        @site_folder = @jekyll_conf['destination']
        @site_folder ||= '_site/'
      end

      def error(msg)
        raise RuntimeError.new(msg)
      end

      def run(params={})

        error 'No source branch found in deployment configuration' if @src_branch.nil?
        error 'No destination branch found in deployment configuration' if @dst_branch.nil?
        error 'No destination remote found in deployment configuration' if @dst_remote.nil?

        error 'No site folder location found in deployment configuration' if @site_folder.nil?
        
        git = ::Git::Base.open('.')
        
        # Check out the source branch
        # Ideally, I would not do this, but rather have a prerequesite to :compile that checks weither I am on source and am clean
        puts "Checking out #{@src_branch}."
        git.checkout(@src_branch)

        # Check out the destination branch
        puts "Checking out destination branch (#{@dst_branch})."
        git.checkout(@dst_branch)

=begin No need to manually clean up: could use git clean -e _site/ instead
        # Cleanup and Copy output files recursively into the current directory
        puts "Deleting files."
        Find.find('.') do |path|
          if FileTest.directory?(path)
            if File.basename(path) == "_site"
              Find.prune       # Don't look any further into this directory.
            end
          else
            if ( File.basename(path) == "README") || (File.basename(path)[0] == '.')
              Find.prune       # Don't look any further into this directory.
            end
          end
          
          puts "Wanting to delete #{File.basename(path)}"
          #FileUtils.remove_entry_secure(path)
        end
=end
        # Copy files to proper place
        puts "Copying files from #{@site_folder}."
        FileUtils.cp_r(@site_folder.chomp('/') + '/.', '.')
        
        # Remove _site folder
        puts "Nuking site folder (#{@site_folder})"
        FileUtils.rm_rf(@site_folder, :secure => true)
        
        # commit and push
        puts "Committing files to repo."
        time = Time.now
        git.add(:all=>true) 
        git.commit_all("Committed by Rake at #{time.inspect}.")
        puts "Pushing to remote (#{@dst_remote})."
        git.push(git.remote(@dst_remote))

        # Checkout source
        puts "Checking out #{@src_branch}."
        git.checkout(@src_branch)

      end
      
    end

  end
end
