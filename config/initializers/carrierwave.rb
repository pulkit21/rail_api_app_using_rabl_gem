if Rails.env.development?
  CarrierWave.configure do |config|
    config.root = Rails.root.join('tmp') 
    config.cache_dir = 'carrierwave' 
    config.fog_credentials = {
      :provider               => 'AWS',                 
      :aws_access_key_id      => 'AKIAIR7AP3IO3NAEKIBQ',                      
      :aws_secret_access_key  => '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',                     
    }
    config.fog_directory  = 'emangubucket' 
  end
end

if Rails.env.production?
  CarrierWave.configure do |config|
    config.root = Rails.root.join('tmp') 
    config.cache_dir = 'carrierwave' 
    config.fog_credentials = {
      # :provider               => 'AWS',                     
      # :aws_access_key_id      => ENV['AWS_ACCESS_KEY_ID'],                   
      # :aws_secret_access_key  => ENV['AWS_SECRET_KEY'],   

      :provider               => 'AWS',                 
      :aws_access_key_id      => 'AKIAIR7AP3IO3NAEKIBQ',                      
      :aws_secret_access_key  => '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',                            
    }
    #config.fog_directory  = ENV['S3_BUCKET']
    config.fog_directory  = 'emangubucket' 
  end
end