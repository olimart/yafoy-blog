---
title: Mixture review, a front-end development tool for designers and developers
date: '2014-02-04'
tags:
- macaw
- mixture
- review
- web-design-2
- web-development
- webdesign
---

[Mixture](http://mixture.io) is a front-end development tool designed to make your life easier (another one). However Mixture really deserves your attention. Let me walk you through how we empowered its capacities to build a very simple website.

**The objective**

- Code as fast as we could a very simple website with a new tool. The current trend is to build SPA (single page applications) however we went for classic multi-pages static site (multiple page or partials doesn’t really change the amount of files in your project)

- Having a rough design on paper we immediately started to place the various elements on the page

- Then the real stuff begins. How to keep templates light? How to reuse components? How to integrate with Angular for example? How to include JSON files?…

We’ve leveraged a couple of Mixture specific snippets such as the site map function which lets you build navigation elements (using the model data mixture.sitemap)


After a few iterations, we re-used models and included shared data on different blocks to remain DRY

- Keep playing with JSON since use cases are going to explode

**What we like**

- Even though a built-in web server is more and more frequent in front-end tools it’s always nice to see it running without additional work from you. Live updates, means always up-to-date pages. Code on one screen, preview instantly on your second display. It just works

- JSON driven. Coming from the MVC world being able to separate data from the views is quite nice. This way HTML templates remain free from clutter and extra noise

- Liquid template engine is a good choice. There are other options out there (Mustache, HAML…) but liquid is a reasonable and complete solution. Create liquid loops from JSON files is the way to go

- Again, coming from Ruby on Rails, support for preprocessors like Sass, LESS, CoffeeScript and Compass is a requirement


- Boilerplates and templates. Start from a set of defined boilerplates or your own template. In most cases we end up deleting all files but loading Twitter Bootstrap or Zurb Foundation from source is a nice addition

- FTP server integration

**Conclusion**

We don’t code many static sites but Mixture is now part of our workflow. We can’t wait to use it in conjunction of 
[Macaw](http://macaw.co) another very promising web design tool.

We like open-source technology, however for certain elements we leveraged Mixture own magic (navigation). It would be great not to have to so when we change tool it just continues to work. We could have done it without Mixture but more code and since there was no time to waste

By the way you can publish a live copy on Mixture servers for fast iteration and client feedback. 1-click only.
