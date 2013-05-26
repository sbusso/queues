require 'rubygems'
require 'bundler/setup'
Bundler.require

Dir["./lib/*.rb"].each do |rf|
  require rf
end


producers = []

(1..(rand(10) + 2)).each do |i|
  producers << Producer.new(i)
end

puts producers.inspect

broker = Broker.new

producers.each do |prod|
  (1..rand(10)+1).each do |n|
    broker.push prod.message(n)
  end
end

puts broker.messages.inspect
# available_queues.sadd ['q1', 'q2', 'q5']
# waiting_queues.sadd ['q3', 'q4']

# puts waiting_queues.inspect('members')

# waiting_queues.members.each do |s|
#   waiting_list.rpush(s)
# end

# puts waiting_list.inspect('list')
