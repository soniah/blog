---
title: Ruby and Rails – Time, Date, DateTime, TZInfo
author: Sonia Hamilton
date: 2011-06-29
url: /2011/06/30/ruby-and-rails-time-date-datetime-tzinfo/
jabber_published:
  - 1309391731
categories:
  - Other-Tech
tags:
  - Ruby
  - Ruby on Rails
---
From a discussion ([Ruby &#8211; The Non-awesome parts][1]) on the [RORO][2] email list &#8211; the differences between Time, Date, DateTime and TZInfo:

<p style="padding-left: 30px;">
  >> Time vs Date vs DateTime vs TZInfo (vs ActiveSupport::TimeZone). Which<br /> >> do I use and when?
</p>

<p style="padding-left: 30px;">
  Time is a timestamp and can represent a moment in time no matter where<br /> it occurred in the world, agnostic of timezone. Think UNIX timestamps.<br /> Date is a thing on a calendar that might mean a different moment in<br /> time to different people depending on their timezone. Think of Date<br /> for things like recording your birthday. DateTime subclasses Date and<br /> adds hour, minute, second and timezone information to a Date so it<br /> becomes a lot like Time, but that makes me unsure when to use DateTime<br /> and when to use Time, to be honest.
</p>

<p style="padding-left: 30px;">
  Time has timezone capabilities built in. TZInfo has a different set of<br /> timezone capabilities and operates with Time objects, but seems to<br /> ignore their built-in timezone settings. I&#8217;m still not sure why.
</p>

 [1]: http://groups.google.com/group/rails-oceania/browse_thread/thread/6062f24822b3b3fc/981124480429da9f?lnk=gst&q=Re%3A+Ruby%3A+the+non-awesome+parts#981124480429da9f
 [2]: http://rubyonrails.com.au/
