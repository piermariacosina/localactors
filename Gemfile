source :rubygems

# Server requirements
#gem 'thin'
gem "puma"
# or mongrel
# gem 'trinidad', :platform => 'jruby'

# Project requirements
gem 'rake'

gem 'sinatra-flash', :require => 'sinatra/flash'
gem 'sinatra-redirect-with-flash'

# Component requirements
gem 'rack-google-analytics', :require => "rack/google-analytics"
gem 'compass'
gem 'compass-h5bp'
gem 'haml'
gem 'susy'
gem 'yui-compressor', :require => 'yui/compressor'
gem 'gibbon'
gem 'rack-google-analytics'
gem 'rdiscount'


# Test requirements
group :development, :test do
	gem 'rspec', :group => "test"
	gem 'rack-test', :require => "rack/test", :group => "test"
	gem 'guard-rspec'
	gem 'guard-spork'
	gem 'spork'
end

group :test do
	gem 'capybara'
	gem 'rb-fsevent'
	gem 'terminal-notifier-guard'
	gem 'rspec-padrino'
end

# Padrino Stable Gem
gem 'padrino', '0.10.7'
gem 'padrino-contrib'


group :development do
	gem 'annotate'
	gem 'awesome_print'
	gem 'oily_png'
end

# Or Padrino Edge
# gem 'padrino', :git => 'git://github.com/padrino/padrino-framework.git'

# Or Individual Gems
# %w(core gen helpers cache mailer admin).each do |g|
#   gem 'padrino-' + g, '0.10.7'
# end
