Swaggard.configure do |config|
  config.api_formats = [:json]

  config.models_path = %W[#{Rails.root}/app/serializers/**/*.rb
                          #{Rails.root}/app/sanitizers/**/*.rb]
end