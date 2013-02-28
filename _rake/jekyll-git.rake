#Import my jekyll-git.rb with the git deploy code in it
require "#{File.expand_path(File.dirname(__FILE__))}/jekyll-git"

namespace :deploy do
  desc 'compile and upload the results to Github'
  task :git => :compile do
    config_name = ENV['config'] || :default
    
    deployer = JekyllGit::Deploy.new

    # Run the deployer. Config does not yet do anything (where did I find this mess?)
    deployer.run(:config_name => config_name)
  end
end
