---
title: Debugging Cocoa
author: niklas
layout: post
permalink: /archives/2008/04/03/debugging-cocoa/
categories:
  - Technology
---
<a href="http://www.cocoadev.com/index.pl?DebuggingAutorelease" class="broken_link">Debugging Autorelease</a> is a great wiki entry at CocoaDev. EXC\_BAD\_ACCESS, meaning accessing an object you&#8217;ve already released (most likely) or have not yet instantiated (it happens) isn&#8217;t that fun to debug. Luckily, the NSZombie environment variable works when developing for iPhone as well, and I could find the error that had cost me most of my day. Yay! <img src='http://blog.saers.com/wp-includes/images/smilies/icon_smile.gif' alt=':-)' class='wp-smiley' /> Other good resources for debugging are <a href="http://www.cocoadev.com/index.pl?DebuggingTechniques" class="broken_link">Debugging Techniques</a> and [Mac OS X Debugging Magic][1]

 [1]: http://developer.apple.com/technotes/tn2004/tn2124.html