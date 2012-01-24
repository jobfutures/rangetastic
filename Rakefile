require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "rangetastic"
    gem.summary = %Q{Simple filtering by date ranges for ActiveRecord}
    gem.description = %Q{Filter dates for ActiveRecord using very simple _between syntax}
    gem.email = "chris.herring.iphone@gmail.com"
    gem.homepage = "http://github.com/cherring/rangetastic"
    gem.authors = ["Chris Herring"]
    gem.add_dependency "rails", "3.1.2"
    gem.add_development_dependency "rspec", ">= 1.2.9"
    gem.add_development_dependency "combustion", '~> 0.3.1'
  end
  Jeweler::GemcutterTasks.new
  
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: sudo gem install jeweler"
end

begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

require 'rspec/core'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "rangetastic #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
