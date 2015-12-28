CarrierWave.configure do |config|
  #config.fog_provider = 'fog/aws'                        # required
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     'AKIAJ7HUARQBNCZK7CXA',                        # required
    aws_secret_access_key: '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',                        # required
    region:                'ap-northeast-1'                  # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = 'jiungbucket'#'okphoto'                          # required

end