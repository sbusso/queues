class Worker1 < Worker
  @@queue = :create

  def perform(message)
    sleep random(10) + 1
    # prepare message
  end
end
