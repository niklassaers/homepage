---
title: Solution to OS X Mail stopped downloading GMail messages via POP3/SSL
author: niklas
layout: post
permalink: /archives/2007/04/02/solution-to-os-x-mail-stopped-downloading-gmail-messages-via-pop3ssl/
categories:
  - Technology
---
A few times I&#8217;ve experienced that OS X&#8217; Mail has just stopped downloading new messages via POP from GMail. I&#8217;ve been all around Google&#8217;s mail system to try to figure out why Mail and GMail all the sudden won&#8217;t co-operate anymore. Not having any luck there I began exploring and found a solution:

For the sake of example, my account will be called username@gmail.com

Go to ~/Library/Mail/POP-username@gmail.com@pop.gmail.com

In that folder there is a file called MessageUidsAlreadyDownloaded2. It&#8217;s an XML file that contains stamps of when what mail downloaded from GMail. Mine was about 45k large. I quit mail, moved this file away (just in case) and started Mail again. And voila! Mail is downloading mail from GMail via POP3S again. <img src='http://blog.saers.com/wp-includes/images/smilies/icon_smile.gif' alt=':-)' class='wp-smiley' /> And it picked right up on where it left of. <img src='http://blog.saers.com/wp-includes/images/smilies/icon_smile.gif' alt=':-)' class='wp-smiley' />