class Broker

  def initialize
    waiting_list.empty
  end

  def redis
    @redis ||= Redis.new(:driver => :hiredis)
  end

  ## Workers
  #
  def workers
    @workers ||= RedisObject.new(@redis, 'workers')
  end

  def active_workers
    @active_workers ||= RedisObject.new(@redis, 'active_workers')
  end

  def waiting_workers
    @waiting_workers ||= RedisObject.new(@redis, 'waiting_workers')
  end

  ## Queues
  #
  def available_queues
    @available_queues ||= RedisObject.new(@redis, 'available_queues')
  end

  def waiting_queues
    @waiting_queues ||= RedisObject.new(@redis, 'waiting_queues')
  end

  def waiting_list
    @waiting_list ||= RedisObject.new(@redis, 'waiting_list')
  end

  def working_queues
    @working_queues ||= RedisObject.new(@redis, 'working_queues')
  end

end
