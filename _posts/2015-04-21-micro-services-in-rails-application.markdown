---
layout: post
title: Micro services with Rails
date: 2015-04-21 03:57 UTC
tags:
---

So you've heard about the new kid on the block and the need to decouple business logic in small chunks (monolithic architecture versus microservice).

You've heard about keeping controllers skinny and models fat, but you end up with bloated models as your application grows and needs to interact with external services such as stripe, github, twillio...

Here is the architecture pattern we've put in place in RoR applications when comes time to deal with APIs or process-intensive requests. One thing to note is that all business logic remains in same codebase, we're not building external services all the time. External microservices require monitoring and jumping from one project to another is not always ideal ([switching cost in PM](http://blog.yafoy.com/blog/2014/04/switching-cost-in-project-management/)).

![Micros services architecture in Rails application](/assets/images/articles/micro-services-architecture.jpg)

**Workflow**

1. Controller receives HTTP request and pass it on to the service layer
2. Services are shared components that can be reused across the application such as FTP service, Payment service, Notification service...
Service's role is to enqueue job and that's it. At this point, the original HTTP request is considered as processed and the end user should receive confirmation "Batch customer import task is in the pipe. Please check in a few minutes). Notification happens either through the user interface or through 201 response code for example, since the whole point is to be able to use services in different parts of your application (public API or classic controller).
3. Job/Worker is asynchronous and handled by a different beast. Usually delegated to Redis + Sidekiq but thanks to ActiveJob, sky is the limit. [Amazon Simple Queue Service (SQS)](https://aws.amazon.com/sqs/) is another great option. Check out [shoryuken gem](https://github.com/phstc/shoryuken) if you plan to use AWS.
4. Finally, for code clarity, behaviour lives in models grouped by category such as carrier integration for instance, with separate models for Canada Post, DHL, Fedex and so on. All inheriting from a base model (since core actions are identical (get rates...), only carrier changes)

**Benefits**

- Smaller pieces of code == easier to test
- Faster response for the client
- If job fails you can reschedule and retry anytime. Job triggered when resources are free up
- Repetitive pattern
- Keep controllers and models light. Scalable
