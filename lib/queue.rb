class Queue


  def initialier(name)
    @name = name
  end

  def name
    @name
  end

  def size
    messages.size
  end

  def messages
    @messages ||= []
  end
end
