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
