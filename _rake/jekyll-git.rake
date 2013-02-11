require "#{File.expand_path(File.dirname(__FILE__))}/jekyll-git"

namespace :deploy do
  desc 'compile and upload the results to Github'
  task :git => :compile do
    config_name = ENV['config'] || :default
    
    deployer = JekyllGit::GitDeploy.new
    deployer.run(:config_name => config_name)
  end
end
