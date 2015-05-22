---
title: Ruby ARGV, options and OptionParser
author: Sonia Hamilton
date: 2009-10-02
url: /2009/10/02/ruby-argv-options-and-optionparser/
categories:
  - Other-Tech
tags:
  - Ruby
---
A nice Ruby example (for my reference) showing how to parse commandline options; the results are put in a hash called options (created on line 3).

<!--more-->

Interestingly, the ARGV array is automatically extended to include the options method even before **require &#8216;optparse&#8217;** is run. See also **ri OptionParser** and [stderr.org][1]. From [Pragmattic Programmers&#8217; Best of Ruby Quiz][2]:

<pre>if __FILE__ == $0
  require 'optparse'
  options = { :size =&gt; 2 }
  number = ARGV.pop

  ARGV.options do |opts|
    script_name = File.basename($0)
    opts.banner = "Usage: ruby #{script_name} [options] number"

    opts.separator ""

    opts.on("-s", "--size size", Numeric,
      "Specify the size of line segments.",
      "Default: 2"
    ) { |options[:size]| }

    opts.separator ""

    opts.on("-h", "--help", "Show this help message.") { puts opts; exit }

    opts.parse!
  end

end
</pre>

 [1]: http://stderr.org/doc/liboptparse-ruby/optparse.html
 [2]: http://www.pragprog.com/titles/fr_quiz/best-of-ruby-quiz
