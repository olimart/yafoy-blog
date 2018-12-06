---
layout: post
title: Bootstrap Ruby on Rails project
date: 2016-09-10 22:55 UTC
tags:
- collaboration
- rails
- software
---

Rails comes with a few convenient tasks such as `rails db:setup` or `rails db:seed` to help programers get started. These tasks are common and known by anyone with some experience with Ruby on Rails.

In our playbook, we encourage programmers launch existing projects through `rails db:bootstrap` or the short version `rails db:bs`. This executes several standard rake tasks but also load sample data in the database. When developing or testing an application it is often easier to start with some data.

The role of the sample data tasks is to load only a few records so you're not looking at a blank screen. For example, one admin user, 2-3 normal users/clients and a few other records per model to ensure pagination is visible for instance.

One benefit is you can drop the database more frequently and still ensures that everything works. Moreover, by delegating  creation of sample data to the faker or ffaker gem, you get a mix of short and long names which helps you make sure that your UI does not break (a common pitfall is to manually create data with the same text again and again).

To create a new rake task to bootstrap your rails application, simply create a new file under `lib/tasks` with the following content.


    namespace :db do
      desc 'Load sample data from db/sample_data.rb'
      task sample_data: :environment do
        seed_file = File.join(Rails.root, 'db', 'sample_data.rb')
        load(seed_file) if File.exist?(seed_file)
      end

      desc 'Drop, create, migrate, seed and sample_data'
      task bootstrap: [:drop, :create, :migrate, :seed, :sample_data]
    end

    task bs: "db:bootstrap"

We reserve `seeds` file for required data common to all environments (development, testing, production...), such as tax rates or list of provinces for example.
