---
title: No atos(1) in the iPhone dev kit?
author: niklas
layout: post
permalink: /archives/2008/03/24/no-atos1-in-the-iphone-dev-kit/
categories:
  - Technology
---
One thing I love about Java development is the ease of finding bugs through stack traces. Unfortunately, it doesn&#8217;t seem that Cocoa likes being so verbose about it, it prefers just giving memory addresses to the function. CocoaDev <a href="http://www.cocoadev.com/index.pl?StackTraces" class="broken_link">has a nice article</a> about how to add this that&#8217;s based on Apple&#8217;s documentation, but it requires /usr/bin/atos that I cannot find in the iPhone SDK. That doesn&#8217;t mean it&#8217;s not installed, but at this time I have no way of knowing that it is. I have no idea how I should let people beta-test my products and sending automatically back intelligent bug reports without this tool. Ok, I have no idea on how Apple plans to allow for betatesting applications if the AppStore is the only application distribution method, and I have no idea how people do this otherwise as atos(1) isn&#8217;t included with the default OS X system either. <img src='http://blog.saers.com/wp-includes/images/smilies/icon_wink.gif' alt=';-)' class='wp-smiley' /> But I would really, really like to include stack traces with bugreports from beta testers.