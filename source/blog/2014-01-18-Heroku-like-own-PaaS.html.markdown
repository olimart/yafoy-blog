---
title: Heroku like own PaaS
date: '2014-01-18'
tags:
- analysis
- aws
- cloud-platform
- heroku
- paas
- software
---

What is going to be hot in 2014?

Platform-as-a-service (PaaS), for sure. The ability to run your own cloud platform and deploy web apps (node.js, ruby on rails, even PHP and Java) on your own server is getting traction. A giant leap forward was made last year but the real benefits will start rising soon. A couple of great initiatives: 
[flynn](https://flynn.io), dokku, 
[deis](http://deis.io)... with different architectures.

Needless to say such initiatives pop up following the great work at Heroku, and the 
[12-factor app manifest](http://blog.yafoy.com/2013/10/twelve-factor-app/).

Most of these solutions leverage Docker and LXC (Linux container) to separate apps and resources while allowing to scale processes, dynos, and other workers independently . GitHub is hosting most of these open source solutions so expect lots of participation from the community.

Among the possible use cases is to deploy any applications / prototypes quickly without provisioning another server. Web developers can now "control" the end-to-end software development lifecycle (SDLC).

Stay tuned.
