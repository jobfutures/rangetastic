require 'rubygems'
require 'bundler'

Bundler.require :default, :development

Dir["spec/support/**/*.rb"].each {|f| require f}

Combustion.initialize! :active_record