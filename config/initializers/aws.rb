CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'                        # required
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     'AKIAI72SU23S3WQOSZYA',                        # required
    aws_secret_access_key: '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',                        # required
    region:                'ap-northeast-2',                  # optional, defaults to 'us-east-1'
    endpoint:              'https://s3.ap-northeast-2.amazonaws.com' # optional, defaults to nil
  }
  config.fog_directory  = 'yeonjudkwl'                                      # required
  config.fog_attributes = {} # optional, defaults to {}
end