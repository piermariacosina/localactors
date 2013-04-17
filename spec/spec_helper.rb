PADRINO_ENV = 'test' unless defined?(PADRINO_ENV)

require 'rubygems'
require 'spork'

#uncomment the following line to use spork with the debugger
#require 'spork/ext/ruby-debug'

Spork.prefork do

  require File.expand_path(File.dirname(__FILE__) + "/../config/boot")
  require 'capybara/rspec'
  require 'rspec/expectations'

  Capybara.app = Padrino.application
end

Spork.each_run do
  # This code will be run each time you run your specs.

end

RSpec.configure do |conf|
  Capybara.javascript_driver = :webkit
  conf.include Rack::Test::Methods
  conf.include RSpec::Padrino # add this
  conf.include Capybara::DSL
end

def app
  ##
  # You should point toplevel #app method to:
  Padrino.application
end