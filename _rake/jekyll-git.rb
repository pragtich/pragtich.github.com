require 'find'

module JekyllGit
  module JekyllGit::Deploy
    def initialize
      error 'No site configuration found' unless File.file?('_config.yml')
    end

    def run(params={})
      # config to be gotten somewhere else later
      src_branch = 'source'
      dst_branch = 'master'
      dst_remote = 'origin'

      error 'No source branch found in deployment configuration' if src_branch.nil?
      error 'No destination branch found in deployment configuration' if dst_branch.nil?
      error 'No destination remote found in deployment configuration' if dst_remote.nil?
      
      git = ::Git::Base.open('.')
      
      # Check out the source branch
      # Ideally, I would not do this, but rather have a prerequesite to :compile that checks weither I am on source and am clean
      puts "Checking out #{src_branch}."
      git.checkout(src_branch)

      # Check out the destination branch
      puts "Checking out destination branch."
      git.checkout(dst_branch)

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
        
        FileUtils.remove_entry_secure(path)
      end


      puts "Copying files."
      #FileUtils.cp_r(@site.config[:output_dir].chomp('/') + '/.', '.')
      
    end
    
  end

end
