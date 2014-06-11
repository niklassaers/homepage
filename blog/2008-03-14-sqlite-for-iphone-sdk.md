---
title: SQLite for iPhone SDK
author: niklas
layout: post
permalink: /archives/2008/03/14/sqlite-for-iphone-sdk/
categories:
  - Technology
---
After [asking][1] on the MacRumors forums I was pointed back to FMDB that I had looked at a couple of days ago. [FMDB][2] is a Cocoa wrapper for SQLite3. I had a look at it, and after my initial difficulties, I found that I was trying a way to complicated way to use it for my iPhone applications. To add FMDB, simply do the following:

*   in XCode in your project window, rightclick your &#8220;Classes&#8221; and Add -> &#8220;New Group&#8221;, call it FMDB
*   drag the files from *src* in the FMDB package into the new group
*   Rightclick Frameworks, Add -> &#8220;Existing frameworks&#8221;, select /Developer/Platforms/Aspen.platform/Developer/SDKs/Aspen1.2.sdk/usr/lib/libsqlite3.dylib and press &#8220;Add&#8221;
*   Compile, smile and start using it <img src='http://blog.saers.com/wp-includes/images/smilies/icon_smile.gif' alt=':-)' class='wp-smiley' />

 [1]: http://forums.macrumors.com/showthread.php?p=5149746
 [2]: http://gusmueller.com/blog/archives/2008/03/fmdb_for_iphone.html