REDIS_CONFIG = YAML.load( File.open( Rails.root.join("config/redis.yml") ) )[Rails.env]
$redis = Redis.new(REDIS_CONFIG)
#Redis::Objects.redis = $redis
#$redis_ns = Redis::Namespace.new(cnfg[:namespace], :redis => $redis) if cnfg[:namespace]
 
# To clear out the db before each test
$redis.flushdb if Rails.env = "test"