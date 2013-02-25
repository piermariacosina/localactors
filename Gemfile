source :rubygems

# Server requirements
gem 'thin'
#gem "puma"
# or mongrel
# gem 'trinidad', :platform => 'jruby'

# Project requirements
gem 'rake'

gem 'sinatra-flash', :require => 'sinatra/flash'
gem 'sinatra-redirect-with-flash'
gem 'sinatra-cross_origin'

# Component requirements

gem 'compass'
gem 'compass-h5bp'
gem 'haml'
gem 'susy'

# Padrino Stable Gem
gem 'padrino', '0.10.7'
gem 'padrino-contrib'

# gem 'gibbon'
# gem 'rdiscount'


# Test requirements
group :development, :test do
	gem 'rspec', :group => "test"
	gem 'rack-test', :require => "rack/test", :group => "test"
	gem 'guard-rspec'
	gem 'guard-spork'
	gem 'spork'
	gem 'colored'
	gem 'deadweight', :require => 'deadweight/hijack/rails'
end

group :test do
	gem 'capybara'
	gem 'rb-fsevent'
	gem 'terminal-notifier-guard'
	gem 'rspec-padrino'
	gem 'capybara-webkit'
end



group :production do
	gem 'yui-compressor', :require => 'yui/compressor'
	gem 'padrino-rpm'
	gem 'rack-google-analytics', :require => "rack/google-analytics"
end

group :development do
	gem 'annotate'
	gem 'awesome_print'
	gem 'better_errors'
	gem 'oily_png'
	gem 'binding_of_caller'
	
end

# Or Padrino Edge
# gem 'padrino', :git => 'git://github.com/padrino/padrino-framework.git'

# Or Individual Gems
# %w(core gen helpers cache mailer admin).each do |g|
#   gem 'padrino-' + g, '0.10.7'
# end

