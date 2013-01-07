# Enables support for Compass, a stylesheet authoring framework based on SASS.
# See http://compass-style.org/ for more details.
# Store Compass/SASS files (by default) within 'app/stylesheets'

module CompassInitializer
  def self.registered(app)
    require 'sass/plugin/rack'
    require 'susy'

    Compass.configuration do |config|
      config.project_path = Padrino.root
      config.sass_dir = "app/stylesheets"
      config.project_type = :stand_alone
      config.http_path = "/"
      config.css_dir = "public/stylesheets"
      config.images_dir = "images"
      config.images_path = "public/images"
      config.generated_images_dir = "images"
      config.generated_images_path = "public/images"
      config.javascripts_dir = "javascripts"
      config.fonts_dir = "fonts"
      config.output_style = :compress
      config.preferred_syntax = :sass
      
      config.on_sprite_saved do |filename|
        unless filename.match(/^transparent/)
          png8filename = filename.sub(/\.png/, '-fs8.png')
          %x{compile/pngquant/pngquant #{filename}}
          %x{mv -f #{png8filename} #{filename}}   
        end
      end
    end
    
    if Padrino.env == :production
       Sass::Plugin.options[:never_update] = true
    end
     if Padrino.env == :development
        Sass::Plugin.options[:never_update] = false
        Sass::Plugin.options[:always_update] = true
        Sass::Plugin.options[:always_check] = true
        Sass::Plugin.options[:cache] = false
     end



    Compass.configure_sass_plugin!
    Compass.handle_configuration_change!

    app.use Sass::Plugin::Rack
  end
end
