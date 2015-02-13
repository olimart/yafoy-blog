---
title: 'Code review with style: introducing Codeguard'
date: '2015-01-05'
tags:
- ci
- programming
- project
- ruby-on-rails
---

Big plans for 2015, as we're transitioning to a services AND product company.

Indeed as any other shop with limited bandwidth we need to streamline and optimize as much as possible at different levels of the company. Of course, technology is the lever to get us there but it’s more than that. For example, our motto to ‘stay DRY’ inherits from technology stacks we’ve fully embraced over the years, namely Ruby on Rails core principles and 
[12-factor apps manifest](http://blog.yafoy.com/2013/10/twelve-factor-app/). DRY standing for ‘Don’t Repeat Yourself’. Although it is a programming concept it makes sense to spread it across the Company.

Code review is one important piece of the workflow. Reviewing code is time-consuming but required to deliver quality software. Being able to quickly detect code violations and ignored best practices is a way to save time.


[Codeguard](https://codeguard.herokuapp.com) is a static code analyzer built on top of the GitHub API that will review pull requests and make inline comments if code violations are detected. Checks are done against community-driven 
[Ruby Style Guide](https://github.com/bbatsov/ruby-style-guide). This is a great way to leverage effort from the Community and ensuring consistency across projects. Consistency reduces learning curve and improves time to be fully functional.
Behind the scene Codeguard relies on 
[Rubocop](https://github.com/bbatsov/rubocop) gem to detect code violations.

Convention over configuration (another principle from the 12-factor apps manifest) lets you run check spots in the code base to quickly identify common issues.
Codeguard bot becomes the first layer in your CI (Continuous Integration) strategy. Submit a Pull Request and Codeguard will automatically make comments and notify the author if something is not right. No more time wasted about trailing whitespaces and code formatting for example.
