# Defines our constants
PADRINO_ENV  = ENV['PADRINO_ENV'] ||= ENV['RACK_ENV'] ||= 'development'  unless defined?(PADRINO_ENV)
PADRINO_ROOT = File.expand_path('../..', __FILE__) unless defined?(PADRINO_ROOT)

# Load our dependencies
require 'rubygems' unless defined?(Gem)
require 'bundler/setup'
Bundler.require(:default, PADRINO_ENV)

# Setup better_errors
if Padrino.env == :development
	require 'better_errors'
	Padrino::Application.use BetterErrors::Middleware
	BetterErrors.application_root = PADRINO_ROOT
	BetterErrors.logger = Padrino.logger
	#Enable live relead middleware rack
	require 'rack-livereload'
	require 'yajl'
end

# require 'gibbon'
#require 'rdiscount'
require 'sinatra/cross_origin'









##
# ## Enable devel logging
#
# Padrino::Logger::Config[:development][:log_level]  = :devel
# Padrino::Logger::Config[:development][:log_static] = true
#

#
# ## Configure your HTML5 data helpers
#
# Padrino::Helpers::TagHelpers::DATA_ATTRIBUTES.push(:dialog)
# text_field :foo, :dialog => true
# Generates: <input type="text" data-dialog="true" name="foo" />
#
# ## Add helpers to mailer
#
# Mail::Message.class_eval do
#   include Padrino::Helpers::NumberHelpers
#   include Padrino::Helpers::TranslationHelpers
# end

##
# Add your before (RE)load hooks here
#
Padrino.before_load do
	I18n.default_locale = :en
end

##
# Add your after (RE)load hooks here
#
Padrino.after_load do
	DataMapper.finalize
end

Padrino.load!
