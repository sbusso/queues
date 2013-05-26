require 'rubygems'
require 'bundler/setup'

Bundler.require

redis = Redis.new(:driver => :hiredis)

waiting_list = 'waiting_list'


class RedisObject
  def initialize(redis, name)
    @redis = redis
    @_key = name
  end

  def list
    @redis.lrange @_key, 0, (@redis.llen @_key)
  end

  def empty
    @redis.del @_key
  end

  def members
    @redis.smembers @_key
  end

  def inspect(method)
    %(#{"%-18s:" % @_key} #{self.send method})
  end

  private

  def method_missing (method_name, *args, &block)
    return @redis.send(method_name, @_key, *args, &block) if @redis.respond_to?(method_name)
    super(method_name, @_key, *args, &block)
  end
end


# set of waiting queues
# list of waiting queue
# pop a queue to start a job
# remove from set when job ends
# if message wait in queue then add to set
#

# available queues: set
# waiting queues: set + list
# working queues: set


available_queues = RedisObject.new(redis, 'available_queues')
waiting_queues = RedisObject.new(redis, 'waiting_queues')
waiting_list = RedisObject.new(redis, 'waiting_list')
waiting_list.empty
working_queues = RedisObject.new(redis, 'working_queues')

available_queues.sadd ['q1', 'q2', 'q5']
waiting_queues.sadd ['q3', 'q4']

puts waiting_queues.inspect('members')

waiting_queues.members.each do |s|
  waiting_list.rpush(s)
end

puts waiting_list.inspect('list')

class Message
  def initialize(message)
    @message = message
  end
end



class Broker
end


class Worker
  def initialize(number)
    @number = number
  end

  def inspect
    "worker_#{@number}"
  end

  def start_work

  end

  def perform

  end

  def end_work

  end
end

