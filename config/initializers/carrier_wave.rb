if Rails.env.production?
CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    :provider              => 'AWS',
    :region                => ENV['S3_REGION'], 
    :aws_access_key_id     => ENV['S3_ACCESS_KEY'],
    :aws_secret_access_key => ENV['S3_SECRET_KEY']
  }

  config.fog_directory     =  ENV['S3_BUCKET']
  config.fog_attributes = { cache_control: "public, max-age=#{365.days.to_i}" } 
  # config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/bodespace'
end
CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/ 
end