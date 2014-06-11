---
title: Customizing Gallery 2
author: niklas
layout: post
permalink: /archives/2004/09/12/customizing-gallery-2/
categories:
  - Blogs
---
In a response to an <a href="http://binarybonsai.com/archives/2004/09/10/gallery-woes-yet-again/" class="broken_link">ongoing discussion</a> at Binary Bonsai, I decided to implement Gallery 2 for Kubrick. Estimated time: 30 minutes. This is not Vanilla Kubrick, this is my bastardized version, I just copy-pasted most of the plain HTML and made sure all the CSS was in the CSS file. Reason being, { and } are &#8220;smart tags&#8221; in Gallery 2. Ok, so let&#8217;s go.

First of all, Gallery 2 CVS as of today. Get it. 

Now, if people would like me to post my modified files, do leave a comment (can&#8217;t be bothered if no-one cares <img src='http://blog.saers.com/wp-includes/images/smilies/icon_wink.gif' alt=';-)' class='wp-smiley' /> ) And, unless other licenses forbid it (i.e, GPL kicks in), all files will be under the standard two-clause BSD license.

Ok, here we go: Copy templates/global.tpl to templates/global.tpl.local and edit the local-file. I ripped out all except for *{include file=&#8221;gallery:\`$main.viewHeadFile\`&#8221; l10Domain=$main.viewL10Domain}* and *{include file=&#8221;gallery:\`$main.viewBodyFile\`&#8221; l10Domain=$main.viewL10Domain}*. You can view variables with a tag like this: *{$main.viewBodyFile }*.

Next file up, layouts/matrix/templates/albumBody.tpl that again is copied to albumBody.tpl.local and after you&#8217;ve edited that one you may want to edit singleBody.tpl for the full-size pictures, sidebar.tpl for options and pathbar.tpl for the breadcrums. Not too much of a hassle, really. I think Gallery 2 is coming somewhere. <img src='http://blog.saers.com/wp-includes/images/smilies/icon_smile.gif' alt=':)' class='wp-smiley' /> But then again, I would love to see this streamlined into one file as with WordPress. Oh well, I&#8217;ve got in half an hour a Kubrick-like Gallery 2 implementation. Now for the tweaking&#8230;. (you see from the heading how bad I am with colours and layout <img src='http://blog.saers.com/wp-includes/images/smilies/icon_wink.gif' alt=';-)' class='wp-smiley' /> )