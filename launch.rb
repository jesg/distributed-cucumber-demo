require 'redis'
require 'jcukeforker'

class RedisScenarioQueue

  attr_reader :key

  def initialize(key)
    @redis = Redis.new
    @key = key
  end

  def shift
    @redis.lpop key
  end
end

queue = RedisScenarioQueue.new ARGV[0]

JCukeForker::Runner.run queue,
  :max => 2,
  :format => :pretty,
  :out => 'reports'
