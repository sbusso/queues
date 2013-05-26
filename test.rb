require 'rubygems'
require 'bundler/setup'
Bundler.require

Dir["./lib/*.rb"].each do |rf|
  require rf
end





available_queues.sadd ['q1', 'q2', 'q5']
waiting_queues.sadd ['q3', 'q4']

puts waiting_queues.inspect('members')

waiting_queues.members.each do |s|
  waiting_list.rpush(s)
end

puts waiting_list.inspect('list')
