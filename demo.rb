require 'redis'
require 'simpleworker'
require 'jcukeforker'

redis = Redis.new
key = "jcukeforker:#{redis.randomkey}"
redis.rpush key, JCukeForker::Scenarios.all

SimpleWorker::Runner.run "ruby launch.rb #{key}"
