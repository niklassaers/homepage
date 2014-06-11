---
title: iPhone SDK questions and comments
author: niklas
layout: post
permalink: /archives/2008/03/09/iphone-sdk-questions-and-comments/
categories:
  - Technology
---
So, two days of implementing ideas, trying stuff out, reading discussions, documentation and watching videos have passed since the iPhone SDK was launched. My dayjob has become developing for the platform, which is great. It&#8217;s a fun platform to work with and developing for it is quick. I&#8217;m really looking forward to Apple delivering those certificates soon so I can try it out on the iPod Touch (no iPhone in Denmark yet).

So that was rant number one, certificates. Why-oh-why do I need them when I do software development? I would also very much like to be able to share my apps with friends, perhaps even beam them wirelessly over to them. And I should be able to do this with a self-signed certificate like with SSL. Self-signed for development, signed by an authority for production, that&#8217;s a good scheme.

What&#8217;s up with Bluetooth? Has anyone been able to access it through the SDK yet?

I write applications that want to synchronize with a repository of files on the computer. How can I arrange such a synchronization without making a web service that the user first can synchronize with his computer and then with his ipod/iphone?

Multitasking. Sure, I can save and restore my application for most things. But if I have to download the files I need from the network, the user is going to switch applications. (I&#8217;m still looking forward to see how I best should work with webservices) Good thing that  
[ramond has gotten background-running apps to work][1], but this will break with Apple&#8217;s license, so no idea if this would kill the product on the iTunes App store. We&#8217;ll have to wait and see for that

.

The videos refer to the XCode and Cocoa-dev mailinglists on [lists.apple.com][2], but the moderator on the Cocoa-dev list has made it clear that iPhone development related discussions are not welcome

Funny little thing is the metronome app, clearly made by someone who does not play music. The last beat in the group is the accented one in this app. <img src='http://blog.saers.com/wp-includes/images/smilies/icon_wink.gif' alt=';-)' class='wp-smiley' /> But it was a nice illustration as some of the first things I want to make are a metronome and a tuner. The tuner is going to be tricky with the floating point instruction set being reduced in the 16-bit Touch set, might have to recompile as ARM. I&#8217;m looking forward to seeing it outside the simulator (and finding out if the iPod touch has a microphone <img src='http://blog.saers.com/wp-includes/images/smilies/icon_wink.gif' alt=';-)' class='wp-smiley' /> )

How do you unit test these apps? <img src='http://blog.saers.com/wp-includes/images/smilies/icon_smile.gif' alt=':-)' class='wp-smiley' /> 

The apps are sandboxed, so no ssh into the phone without a jailbreak I guess. But ssh clients should be trivial now

So, I&#8217;m excited about this and working with it. I&#8217;m really looking forward to integrating it with our products at work, and I&#8217;m looking forward to writing music apps on my spare time (which is going to be limited until my exam June 9th is over). I guess all of these things will be answered shortly after my exam is done. <img src='http://blog.saers.com/wp-includes/images/smilies/icon_smile.gif' alt=':-)' class='wp-smiley' />

 [1]: http://gizmodo.com/365327/iphone-sdk-limitation-only-one-user+made-app-running-concurrently-no-background-processes#c4605837
 [2]: http://lists.apple.com