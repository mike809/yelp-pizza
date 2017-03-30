require 'yelp'

Yelp.client.configure do |config|
  config.consumer_key = '1AZCgtdmWVD8dYFdlPzzDw' # ENV['CONSUMER_KEY']
  config.consumer_secret = 'Q0HAEdWpap_zmPZQb1wHR-x4b6M' # ENV['CONSUMER_SECRET']
  config.token = '4F8E_5ABHcq2rvfe8kkpGvShtlD-I2d7' # ENV['TOKEN']
  config.token_secret = 'NputXloIgxH6aGGBXIW_Mt_CDgg' # ENV['TOKEN_SECRET']
end