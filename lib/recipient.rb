class Recipient
  @@counter = 0

  def initialize
    @_id = @@counter += 1
  end

  def name
    @name ||= "recipient_#{@_id}"
  end

  def push(message)
    @inbox << message
  end

  def inbox
    @inbox ||= []
  end
end
