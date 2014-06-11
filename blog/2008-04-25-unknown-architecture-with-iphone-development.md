---
title: '&#8220;Unknown architecture&#8221; with iPhone development'
author: niklas
layout: post
permalink: /archives/2008/04/25/unknown-architecture-with-iphone-development/
categories:
  - General
---
Every now and again I get &#8220;Unknown architecture&#8221; when trying to compile. I found [this post][1] that has the solution in the bottom: *  
> From the &#8220;Project&#8221; menu, choose Edit Active Target &#8220; <project-name>&#8220;. Select the &#8220;Build&#8221; tab. In the search box, look for FRAMEWORK\_SEARCH\_PATH. Highlight the row with a search path in it. Press <DELETE> to completely wipe out the path.</p>
</i> I don&#8217;t know quite why there sometimes are more paths there that I don&#8217;t want, but it helps anyways.

 [1]: http://discussions.apple.com/thread.jspa?messageID=7084194