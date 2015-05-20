---
author: sonia
comments: true
date: 2011-06-29 23:55:30+00:00
slug: ruby-and-rails-time-date-datetime-tzinfo
title: Ruby and Rails - Time, Date, DateTime, TZInfo
wordpress_id: 1065
categories:
- Other-Tech
tags:
- Ruby
- Ruby on Rails
---

From a discussion ([Ruby - The Non-awesome parts](http://groups.google.com/group/rails-oceania/browse_thread/thread/6062f24822b3b3fc/981124480429da9f?lnk=gst&q=Re%3A+Ruby%3A+the+non-awesome+parts#981124480429da9f)) on the [RORO](http://rubyonrails.com.au/) email list - the differences between Time, Date, DateTime and TZInfo:


>> Time vs Date vs DateTime vs TZInfo (vs ActiveSupport::TimeZone). Which
>> do I use and when?




Time is a timestamp and can represent a moment in time no matter where
it occurred in the world, agnostic of timezone. Think UNIX timestamps.
Date is a thing on a calendar that might mean a different moment in
time to different people depending on their timezone. Think of Date
for things like recording your birthday. DateTime subclasses Date and
adds hour, minute, second and timezone information to a Date so it
becomes a lot like Time, but that makes me unsure when to use DateTime
and when to use Time, to be honest.






Time has timezone capabilities built in. TZInfo has a different set of
timezone capabilities and operates with Time objects, but seems to
ignore their built-in timezone settings. I'm still not sure why.
