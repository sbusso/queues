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
    sleep random(20) + 1
  end

  def end_work

  end
end
