class Producer
  def initialize(i)
    @name = "producer_#{i}"
  end

  def name
    @name
  end

  def inspect
    name
  end

  def message(n)
    {key: "create", message: "#{name}_message_#{n}"}
  end
end
