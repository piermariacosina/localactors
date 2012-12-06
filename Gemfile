source :rubygems

# Server requirements
# gem 'thin' # or mongrel
# gem 'trinidad', :platform => 'jruby'

# Project requirements
gem 'rake'
gem 'sinatra-flash', :require => 'sinatra/flash'

# Component requirements
gem 'compass'
gem 'compass-h5bp'
gem 'haml'
gem 'susy'
# gem 'yui-compressor', :require => 'yui/compressor'


# Test requirements
group :development, :test do
	gem 'rspec', :group => "test"
	gem 'rack-test', :require => "rack/test", :group => "test"
	gem 'guard-rspec'
	gem 'guard-spork'
	gem 'spork'
	gem 'oily_png'
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
end

# Or Padrino Edge
# gem 'padrino', :git => 'git://github.com/padrino/padrino-framework.git'

# Or Individual Gems
# %w(core gen helpers cache mailer admin).each do |g|
#   gem 'padrino-' + g, '0.10.7'
# end
