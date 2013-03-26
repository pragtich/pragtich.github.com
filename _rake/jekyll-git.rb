require 'find'
require 'git'
require 'time'

module JekyllGit
  module JekyllGit::Deploy
    class Git
      
      def initialize
        error 'No site configuration found' unless File.file?('_config.yml')

        # Get configuration
      end

      def run(params={})
        # config to be gotten somewhere else later; Move to initialize?
        src_branch = 'source'
        dst_branch = 'master'
        dst_remote = 'origin'

        site_folder = '_site/'

        error 'No source branch found in deployment configuration' if src_branch.nil?
        error 'No destination branch found in deployment configuration' if dst_branch.nil?
        error 'No destination remote found in deployment configuration' if dst_remote.nil?

        error 'No site folder location found in deployment configuration' if site_folder.nil?
        
        git = ::Git::Base.open('.')
        
        # Check out the source branch
        # Ideally, I would not do this, but rather have a prerequesite to :compile that checks weither I am on source and am clean
        puts "Checking out #{src_branch}."
        git.checkout(src_branch)

        # Check out the destination branch
        puts "Checking out destination branch."
        git.checkout(dst_branch)

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
        puts "Copying files."
        FileUtils.cp_r(site_folder.chomp('/') + '/.', '.')
        
        # Remove _site folder
        puts "Nuking site folder (#{site_folder})"
        FileUtils.rm_rf(site_folder, :secure => true)
        
        # commit and push
        time Time.now
        git.commit_all('Committed by Rake at #{time.inspect}.')
        git.push

        # Checkout source
        git.checkout(src_branch)

      end
      
    end

  end
end
