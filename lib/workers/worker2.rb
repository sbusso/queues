class Worker2 < Worker
  @@queue = :create

  def perform(message)
    sleep random(10) + 1
    # send message
  end
end
