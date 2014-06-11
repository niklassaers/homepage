---
title: Finding more Lightroom duplicates
author: niklas
layout: post
permalink: /archives/2009/01/09/finding-more-lightroom-duplicates/
categories:
  - General
---
*I have a problem:* I&#8217;ve put all my photos I&#8217;ve taken the past ten years into Lightroom. To ensure that I didn&#8217;t miss any, I&#8217;ve put in all from my server, all from my backups etc etc etc. In short: duplicate galore. Now, I&#8217;ve sorted by filename and removed duplicates. I&#8217;ve sorted by capture time and removed duplicates. That made me go from 88k to 74k. But I still have duplicates. They have different times because some were posted in my galleries. They have different sizes because some were thumbnails. They have different names because some were exported and sent via mail. And some are more odd, or perhaps a combination of them all. But in 74k photos, finding duplicates and deciding which one to keep is hard!

*I have made a solution:* a little Python script that will go through the Lightroom database, generate a 9&#215;9 thumbnail of the photo, and compare it to all other photos. It takes a couple of hours to run on my 74k photos, helped me clean out 2k duplicates with only two false positives. That&#8217;s not bad!

What it does is that it sets the label with a string representing the thumbnail, and then you sort your grid view by label and voila, you&#8217;re good to go. Since it goes for the raw files, it will find duplicates even if they have been corrected or worked on afterwards:  
  
![][1]  
  
Another example is that if you&#8217;ve changed the colours a bit around, it will still find it:  
![][2]  
  
So that&#8217;s all very nice. <img src='http://blog.saers.com/wp-includes/images/smilies/icon_smile.gif' alt=':-)' class='wp-smiley' /> [Here&#8217;s the source code][3], under BSD license. Put it in your Lightroom directory together with Lightroom.lrdata. And oh, btw, if it blows up anything at all, do tell me, but don&#8217;t hold me responsible. This hasn&#8217;t been tested on much. But if you read the code, I think you&#8217;ll find it can do very limited harm

Challenges ahead: 
*   RAW files not supported yet
*   Doesn&#8217;t work too well on the different size problem, must find a better solution
*   Faster run times?

Hope you can use it as well as it helped me

 [1]: /content-files/duplicates.jpg
 [2]: /content-files/difcolours.jpg
 [3]: /content-files/LabelRoom.py