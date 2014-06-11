---
title: RAW support in iPhoto
author: niklas
layout: post
permalink: /archives/2005/01/31/raw-support-in-iphoto/
categories:
  - Photography
  - Technology
---
Apple sent me a mail saying my iLife copy has been dispatched. In the mean time, <a href="http://www.californiafox.com/archives/working_with_raw_in_iphoto_05.php" class="broken_link">California Fox</a> reports that iPhoto&#8217;s RAW support is, well, fake. It imports RAWs, but rather than use the RAW files as a source when modifying brightness, temperature, exposure, saturnation etc, it uses an intermediate JPG copy. And as we all know, this just isn&#8217;t the same. This is not what we asked for when we wanted RAW support, and just not mentioning this and waiting for people&#8217;s reactions seems just irresponsible on Apple&#8217;s part.

In the mean time, I&#8217;ve come across [f-spot][1] and I&#8217;m currently tracking its CVS and looking at integrating Udi Fuchs&#8217; [ufraw][2] into it. This&#8217;ll be my first shot at C#, so I&#8217;m wondering both how the task will be and how people will respond to it. I do NOT, however, plan to settle on intermediate JPGs. <img src='http://blog.saers.com/wp-includes/images/smilies/icon_wink.gif' alt=';-)' class='wp-smiley' />

 [1]: http://www.gnome.org/projects/f-spot/
 [2]: http://ufraw.sourceforge.net/