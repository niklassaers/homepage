---
title: launchd problems?
author: niklas
layout: post
permalink: /archives/2008/10/08/launchd-problems/
categories:
  - Technology
---
Does your console log look much like

<pre>Oct  8 22:23:56 MyComputer com.apple.launchd[210] (com.company.app.task): Throttling respawn: Will start in 10 seconds
Oct  8 22:24:02 MyComputer com.apple.launchd[1] (com.company.app.task)[39664]): posix_spawnp("/Library/Vendor/Folder/task", ...): No such file or directory
Oct  8 22:24:02 MyComputer com.apple.launchd[1] (com.company.app.task)[39664]): Exited with exit code: 1
Oct  8 22:24:02 Halloumi com.apple.launchd[1] (com.company.app.task): Throttling respawn: Will start in 10 seconds
</pre>

then chances are you&#8217;ve installed software and deleted it again. We all do from time to time, some more frequent than other. This can be quite annoying when debugging a problem, as well as fill up space and drown more important messages. launchd is the cron of OS X, but you won&#8217;t find /etc/launchd.conf. Instead, look in /Library/LaunchAgents and ~/Library/LaunchAgents and you&#8217;ll find the ones that started the problem