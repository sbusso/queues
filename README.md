# Scope

This code aims to help setting up a queue management with specific needs:
* multitenant application
* numner of worker per tenant is limited
* 1 worker / job / time

Looking at RabbitMQ, ZeroMQ, Sidekiq

1. set of waiting queues
2. list of waiting queue
3. pop a queue to start a job
4. remove from set when job ends
5. if message wait in queue then add to set

* available queues: set
* waiting queues: set + list
* working queues: set
