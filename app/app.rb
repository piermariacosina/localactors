class Localactors < Padrino::Application
  register Padrino::Rendering
  register Padrino::Mailer
  register Padrino::Helpers

  # register Padrino::Contrib::Helpers::AssetsCompressor

  register CompassInitializer
  
  load 'cockpito_data_sender.rb'
  
  enable :sessions
  
  configure do
    # MailChimp configuration: ADD YOUR OWN ACCOUNT INFO HERE!
    # Gibbon.api_key = "d56cc299106c03af76a91763efab386e-us6"
    # Gibbon.timeout = 15
    # Gibbon.throws_exceptions = false

    # set :mailchimp_list_id, "a060862fbc"
  
    enable :cross_origins
  end
  
  
  configure :production do
    register AnalyticsInitializer
    require 'padrino-contrib/helpers/assets_compressor'
    require 'padrino-rpm'
    require 'newrelic_rpm'
    register Padrino::Cache
    enable :caching
    enable :asset_stamp
     
  end
  
  configure :development do
     disable :caching
     enable :asset_stamp
  end  
  
  get '/' do
    #c = CockpitoDataSender.new
    #c.increment('localactors.views', 1)
    check = params[:newsletter]
    if check == "success"
      
      flash.now[:success] = '<div class="box"><span class="symbol"><i>V</i></span><span class="msg">'+check+'</span></div>'
    else
      flash.discard
    end
    render "index"
  end
  
  # get '/terms' do
  #   render "terms"
  # end
  
  get '/mail' do
    render "mails/mailing-list", :layout =>false
  end
  

  
  
  
  get '/callforprojects' do
    #c = CockpitoDataSender.new
    #c.increment('localactors.callforproject', 1)
    render "call_for_projects"
  end
   
  get '/ourapproach' do
    #c = CockpitoDataSender.new
    #c.increment('localactors.whoweare', 1)
    render "our_approach"
  end
  
  get '/projects' do
    #c = CockpitoDataSender.new
    #c.increment('localactors.whoweare', 1)
    render "projects"
  end
  
  get '/single_project' do
    #c = CockpitoDataSender.new
    #c.increment('localactors.whoweare', 1)
    render "single_project"
  end
   
  # get '/subscribe', :provides => [:html, :json] do
  # 
  #   c = CockpitoDataSender.new
  #   c.increment('localactors.subscribe', 1)
  #   email = params[:email]
  #   mail_submit(email, content_type)
  # end


  ##
  # Caching support
  #
  # You can customize caching store engines:
  #
  #   set :cache, Padrino::Cache::Store::Memcache.new(::Memcached.new('127.0.0.1:11211', :exception_retry_limit => 1))
  #   set :cache, Padrino::Cache::Store::Memcache.new(::Dalli::Client.new('127.0.0.1:11211', :exception_retry_limit => 1))
  #   set :cache, Padrino::Cache::Store::Redis.new(::Redis.new(:host => '127.0.0.1', :port => 6379, :db => 0))
  #   set :cache, Padrino::Cache::Store::Memory.new(50)
  #   set :cache, Padrino::Cache::Store::File.new(Padrino.root('tmp', app_name.to_s, 'cache')) # default choice
  #

  ##
  # Application configuration options
  #
  # set :raise_errors, true       # Raise exceptions (will stop application) (default for test)
  # set :dump_errors, true        # Exception backtraces are written to STDERR (default for production/development)
  # set :show_exceptions, true    # Shows a stack trace in browser (default for development)
  # set :logging, true            # Logging in STDOUT for development and file for production (default only for development)
  # set :public_folder, "foo/bar" # Location for static assets (default root/public)
  # set :reload, false            # Reload application files (default in development)
  # set :default_builder, "foo"   # Set a custom form builder (default 'StandardFormBuilder')
  # set :locale_path, "bar"       # Set path for I18n translations (default your_app/locales)
  # disable :sessions             # Disabled sessions by default (enable if needed)
  # disable :flash                # Disables sinatra-flash (enabled by default if Sinatra::Flash is defined)
  # layout  :my_layout            # Layout can be in views/layouts/foo.ext or views/foo.ext (default :application)
  #

    # error 404 do
    #   render 'errors/404'
    # end
    # 
    # error 505 do
    #   render 'errors/505'
    # end
  
end
