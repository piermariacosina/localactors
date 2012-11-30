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
      config.javascripts_dir = "javascripts"
      config.fonts_dir = "fonts"
      config.output_style = :nested
      config.preferred_syntax = :sass
    end

    Compass.configure_sass_plugin!
    Compass.handle_configuration_change!

    app.use Sass::Plugin::Rack
  end
end
