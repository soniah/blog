---
author: sonia
date: 2015-05-28
url: /2015/05/28/eloquent-ruby/
title: Eloquent Ruby
categories:
- Linux
tags:
- Ruby
---

My notes on Russ Olsen's excellent book [Eloquent
Ruby](http://eloquentruby.com/). These aren't meant to be full and
complete notes they're just things I want to remember; for more details
see the book.

<!--more-->

## Chapter 18. Execute Around with a Block

Use _Execute Around_ to do things before and/or after other blocks of
code eg logging, opening/closing files or databases, etc. Value can be
passed in via parameters, or passed out via _yield_.

{{< highlight ruby >}}
# &block is optional, but helps document function
def with_logging(text, &block)
  begin
    puts ">> START:  #{text}"
    result = yield # no if, so need a block
    puts "<< END:    #{text}"
    result # return result of block - chaining
  rescue
    puts "-- FAILED: #{text}"
    raise
  end
end

def someFunction
  # var1 will be visible inside with_logging - blocks are closures
  var1 = 'something'
  # someFunction will return 3 because with_logging returns 'result'
  with_logging('doing addition') { 1 + 2 }
end
{{< /highlight >}}

Another example is _yielding for flexible initialization_:

{{< highlight ruby >}}
class EC2
  attr_accessor :json
  def initialize(cmd)
    result = `#{cmd}`
    @json = JSON.parse(result)
    yield(self) if block_given?
  end
end

instance = new EC2('aws ec2 describe-instances') do |ec2|
  ec2.json[insertDate] = Time.new.strftime("%Y-%m-%d %H:%M:%S").to_s
end
{{< /highlight >}}


