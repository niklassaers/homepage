---
title: Compile Protobuf for iOS
author: niklas
layout: post
permalink: /archives/2012/02/05/compile-protobuf-for-ios/
categories:
  - iOS
  - Technology
  - Work
---
For a project I&#8217;m doing at work, that I hope will eventually be open source, I needed to have protobuf compiled for iOS. A colleague of mine showed me how it had been compiled on iOS 4, [using these scripts][1], but with iOS 5 I ended up with binaries compiled for the arm architecture instead of the armv7 architecture.

Be aware that the iOS 5 SDK actually ships with a version of protobuf, but it&#8217;s a bit old, being version 2003001. And it only ships the binary, not the headers.

To compile protobuf, [grab the latest source][2] (which is 2.4.1 at the time of writing this) and run the following script (<a href="https://gist.github.com/gists/1744769/download" class="broken_link">download script</a>):



After running this, you should have a directory called /tmp/protobuf/arm that is compiled for your iPhone or iPad with the armv7 architecture. Copy that into your project and start using protobuf <img src='http://blog.saers.com/wp-includes/images/smilies/icon_smile.gif' alt=':-)' class='wp-smiley' />

 [1]: http://groups.google.com/group/protobuf/browse_thread/thread/a3d3b14ba5f88ef2/97c0babd3c64b00e?hl=en&lnk=gst&q=iphone+arch#97c0babd3c64b00e
 [2]: http://code.google.com/p/protobuf/downloads/list