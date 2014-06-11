---
title: Clang for iPhone
author: niklas
layout: post
permalink: /archives/2009/02/14/clang-for-iphone/
categories:
  - Technology
---
Jeff wrote [a nice Clang introduction][1] on <a href="http://clang.llvm.org/StaticAnalysisUsage.html#Obtaining" class="broken_link">Clang</a> that I ran on my Well Tempered code to check out what bugs I could find. I had some convention breaches and a couple of minor leaks that would turn up when the program was closed and its state was saved, so while not beating me up, it was great to get the feedback on what parts I had been ignoring so far. I hope to bring these advices into my code from now on, and I&#8217;m sure I&#8217;ll be running Clang frequently to get this great feedback <img src='http://blog.saers.com/wp-includes/images/smilies/icon_smile.gif' alt=':-)' class='wp-smiley' />

 [1]: http://iphonedevelopment.blogspot.com/2009/02/clang-static-analyzer.html