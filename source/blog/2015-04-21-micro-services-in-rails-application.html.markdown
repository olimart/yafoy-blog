---
title: Micro services with Rails
date: 2015-04-21 03:57 UTC
tags:
---

So you've heard about the new kid on the block and the need to decouple business logic in small chunks (monolithic architecture versus microservice).

You've heard about keeping controllers skinny and models fat, but you end up with bloated models as your application grows and needs to interact with external services such as stripe, github, twillio...

Here is the architecture pattern we've put in place in RoR applications when comes time to deal with APIs or process-intensive requests. One thing to note is that all business logic remains in same codebase, we're not building external services all the time. External microservices require monitoring and jumping from one project to another is not always ideal ([switching cost in PM](http://blog.yafoy.com/blog/2014/04/switching-cost-in-project-management/).

![Micros services architecture in Rails application](articles/micro-services-architecture.jpg)

**Workflow**

1. Controller receives request which pass it on to the service layer
2. Services are structured around reusable components across the application (FTP service, Payment, Notification...). Service's role is to enqueue job and that's it. At this point, the initial request is considered as complete and the system notifies the users through the interface
3. Job/Worker is asynchronous and handled by a different beast. Usually Redis + Sidekiq but thanks to ActiveJob sky is the limit. [Amazon Simple Queue Service (SQS)](https://aws.amazon.com/sqs/) is another great option. Check out [shoryuken gem](https://github.com/phstc/shoryuken) if you plan to use AWS.
4. Finally, for code clarity, behaviour lives in model grouped by category such as carrier integration for instance, with separate models for Canada Post, DHL, Fedex and so on. All hineriting from a base model (since core action is identical (get rates), only carrier changes)

**Benefits**

- Smaller pieces = easier to test
- Faster response for the client
- If job fails you can reschedule and retry anytime. Job triggered when resources are free up
- Repetitive pattern
- Keep controllers and models light. Scalable
