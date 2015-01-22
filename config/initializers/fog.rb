CarrierWave.configure do |config|
  config.storage :fog

  config.fog_credentials = {
    :provider               => 'AWS',                        # required
    :aws_access_key_id      => ENV['AWS_ACCESS_KEY_ID'],                        # required
    :aws_secret_access_key  => ENV['AWS_SECRET_ACCESS_KEY'],                   # required
    # :region => "southeast-2",
    :region => "us-west-2",
    :endpoint => "https://s3-ap-southeast-2.amazonaws.com"
  }

  config.fog_directory  = 'sensei-app'                          # required
  config.fog_attributes = {'Cache-Control'=>"max-age=#{365.day.to_i}"} # optional, defaults to {}
  config.cache_dir = "#{Rails.root}/tmp/uploads"
end