# Spec

This code aims to help setting up a queue management with specific needs:
* multitenant application
* numner of worker per tenant is limited
* 1 worker / job / time
* sequential jobs
* dynamic queues ? depend on how many consumer
* on consumer will send job1 and job2 in sequence for 100 messages.
* job1 and job2 cannot operate at same time: latency, timeout
* queue 100 messages for job1
* result of job1 is queued for job2
* * share workers among queues

Looking at RabbitMQ, ZeroMQ, Sidekiq

1. set of waiting queues
2. list of waiting queue
3. pop a queue to start a job
4. remove from set when job ends
5. if message wait in queue then add to set

* available queues: set
* waiting queues: set + list
* working queues: set
