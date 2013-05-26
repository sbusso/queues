require 'rubygems'
require 'bundler/setup'
Bundler.require

require './lib/redis_object'
require './lib/worker'

redis = Redis.new(:driver => :hiredis)

waiting_list = 'waiting_list'

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
  # def
end


class Producer
  def send_message(routing, message)
    # broker.
  end
end


