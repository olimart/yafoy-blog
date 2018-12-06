---
layout: post
title: Twelve-Factor app
date: '2013-10-01'
tags:
- heroku
- methodology
- programming
- software
- web-app
---

What is a Twelve-Factor application? It is a methodology developed by Adam Wiggins, one of the co-founders of Heroku and that should be embraced by any modern web development shop. It aims at writing apps that maximize automation, offer maximum portability, can be deployed on modern cloud platforms, allow for continuous deployment, and scale quickly. It particularly applies to web apps based on the 
software-as-a-service (SaaS) business model.

It follows [12 key principles](http://http://12factor.net/) and can be summarized as follows:

1. One codebase, multiple deploys: A twelve-factor app is tracked in a single repository in a version-control system. [Git](http://blog.yafoy.com/2013/05/training-is-an-activity/) is the clear choice nowadays

2. Dependency declaration and isolation: It relies on a dependency declaration manifest, external to the codebase but required for the code to execute properly. Dependencies can then be swapped easily if needed. Those dependencies (versions) are managed by a dedicated service like the Gem Bundler for Ruby

3. Store configuration in the environment: When developing an app in multiple environments (staging, production), configuration must differ between these environments to ensure that, for instance, the deployment you use for testing is not making changes to your production database. Environment variables are both language and operating system agnostic, maximizing portability. These configuration variables (config vars) should not be checked in to the codebase.

4. Treat backing services as attached resources: The code for a twelve-factor app makes no distinction between local and third party services. You should be able to swap data stores, messaging/queuing systems, or SMTP systems for sending e-mail without any changes to the app’s code

5. Strictly separate build and run stages: The twelve-factor app uses strict separation between the build, release, and run stages. For example, it is impossible to make changes to the code at runtime, since there is no way to propagate those changes back to the build stage. Thus, each release is unique (code, dependencies, assets...), making it easier to rollback should a problem occur

6. Execute the app as one or more stateless processes: Twelve-factor processes are stateless and share-nothing. Any data that needs to persist must be stored in a stateful backing service, typically a database. The biggest downfall (for us at least) is that sticky sessions are a violation of twelve-factor and should never be used or relied upon

7. Export services via port binding: Twelve-factor apps bind to a port and wait for incoming requests on that port, typically returning an HTTP response or whatever other response type that particular protocol defines. This architecture enables the app to run as a true software as a service (SaaS), allowing it to be a backing service for other apps

8. Concurrency, scale out the process model: The twelve-factor app is completely self-contained and does not rely on runtime injection of a webserver into the execution environment to create a web-facing service. The UNIX process model is mirrored to divide each type of work the app needs to do into different process types. For instance, a web process can serve web requests, while a worker process may run batch processes in the background. These processes collectively form the process formation of the app. This approach makes concurrency easily repeatable and reliable

9. Disposability: Maximize robustness with fast startup and graceful shutdown. Process are "disposable", hence can be started or stopped anytime

10. Mirror environments as closely as possible: Save yourself some time and reduce errors by running the same environment all the way (development, staging, and production)

11. Treat logs as event streams: On traditional platforms, logs are written to a log file that sits on the server’s hard drive. This can result in catastrophe when the app fails because it can no longer write to the local drive, which has been filled with logs. Twelve-factor apps do not concern themselves with writing logs or how they are output. Logs are treated as a stream, where developers can observe them in real time. The archival method for these logs is determined by the developer; and backing services

12. Run admin/management tasks as one-off processes: Maintenance tasks, or database migration scripts to change the data model or other one-off scripts are run against a release and executed as a process, much like any web or worker processes that may be associated with an app. Because the script is included in the codebase, it is easily replicated across developer and production environments
