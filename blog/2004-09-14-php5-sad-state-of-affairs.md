---
title: 'PHP5 &#8211; Sad state of affairs'
author: niklas
layout: post
permalink: /archives/2004/09/14/php5-sad-state-of-affairs/
categories:
  - Work
---
I&#8217;ve been working on installing PHP5 on client webservers the past couple of days, and with some help that&#8217;s been going all right. Much I&#8217;ve read has been on the merits of PHP5 vs PHP4, little have I read on user experience. So here&#8217;s my first experiences with PHP5 and commonly used PHP packages:

*   WordPress &#8211; 1.2 has issues that are solved in 1.3 CVS. Still, it requires rcps (a regular expression library) to be installed, and with this the wp-admin triggers functions that causes a segmentation fault (signal 11) that I haven&#8217;t been able to debug yet
*   Gallery 2 &#8211; doesn&#8217;t come past the &#8220;go to step 1&#8243; in the installer. No news in the error-log
*   phpBB 1.4 &#8211; When setting up, the dialog for setting up the database returns to the default values when pressing the submit button
*   Coppermine &#8211; *Undefined variable: HTTP\_SERVER\_VARS*, *HTTP\_GET\_VARS*, *HTTP\_POST\_VARS* and *HTTP\_COOKIE\_VARS* is output to the error log. The response in the support forums have been (my translation) [We don&#8217;t care about PHP5, it works with PHP4 and if you want to use our stuff, use PHP4][1].

After having read many similar suggestions in the various discussion boards, I was left saddened. With the Segfaults, ok, PHP5 hasn&#8217;t matured enough yet, but from running a couple of hundred jails with PHP4 I know PHP4 segfaults regularly as well. Just not consistently. But obviously people don&#8217;t care to write the PHP-based software they distribute enough to keep up with the general guidelines posted by the PHP developers long ago, the reason that variables like $_GET[] such were introduced. And safe-mode seems to be a no-no. I guess I was to optimistic thinking the pass-by-reference as opposed to pass-by-value would be a little problem for some projects, it seems to be a common problem for many.

So, my task for now will be to move all our clients that want PHP5 back to PHP4 and say no, you can&#8217;t have the benefits of PHP5. And you&#8217;ll probably go coding something that won&#8217;t run PHP5 when finally we can switch to it.

 [1]: http://coppermine.sourceforge.net/board/index.php?topic=9602.0