module AnalyticsInitializer
  def self.registered(app)
    app.use Rack::GoogleAnalytics, :tracker => 'UA-22904820-17', :async => true

  end
end
