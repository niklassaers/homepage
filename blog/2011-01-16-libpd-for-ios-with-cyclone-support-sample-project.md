---
title: libpd for iOS with Cyclone support, sample project
author: niklas
layout: post
permalink: /archives/2011/01/16/libpd-for-ios-with-cyclone-support-sample-project/
categories:
  - Technology
---
I [mentioned][1] [libpd][2] for iOS a while ago, and now I found that it&#8217;s ready to be played with. But as soon as I wanted to play with spectral analysis, I started missing tools, so trying to get cartopol~ and poltocart~ to work, I ended up putting in support for all the [Cyclone][3] objects. When the work was done (it compiled and ran fine) I put it on GitHub: <a href="https://github.com/niklassaers/PdTest02WithCyclone" class="broken_link">https://github.com/niklassaers/PdTest02WithCyclone</a>. Many thanks to Richard Lawler for [giving me some guidelines about how to do this][4]. (If I made no sense in the above, you should check out [Pure Data][5])

 [1]: http://blog.saers.com/archives/2010/10/22/puredata-on-iphone/
 [2]: http://gitorious.org/pdlib/pages/Packages
 [3]: http://suita.chopin.edu.pl/~czaja/miXed/externs/cyclone.html
 [4]: http://noisepages.com/groups/pd-everywhere/forum/topic/adding-functions-cartopolpoltocar/#post-799
 [5]: http://puredata.info/