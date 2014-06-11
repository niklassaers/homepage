---
title: Audible on iTunes fix
author: Niklas
layout: post
permalink: /archives/2010/05/29/audible-on-itunes-fix/
categories:
  - Technology
---
I&#8217;ve had a problem forever that when iTunes closes, it forgets the password to the iTunes store, and it forgets the password to my Audible account. I&#8217;ve Googled it once or twice but couldn&#8217;t find the answer, and since I hardly ever close iTunes except for boots, and since Quicksilver is so fast to open 1Password to retrieve my passwords, it&#8217;s only been a minor annoyance. But today I wanted it fixed, and [Audible has actually provided a few solutions][1]. The last one worked for me, I moved the /Library/Preferences/com.audible.data.plist out of place, relaunched iTunes, entered the password, closed and reopened iTunes again, and it still works. Super! <img src='http://blog.saers.com/wp-includes/images/smilies/icon_smile.gif' alt=':-)' class='wp-smiley' /> The new and old files differ not in size, but the key is different and the old file had some flags set on the file.

 [1]: http://audible.custhelp.com/app/answers/detail/a_id/3538