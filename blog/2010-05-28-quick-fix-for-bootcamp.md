---
title: Quick fix for Bootcamp
author: Niklas
layout: post
permalink: /archives/2010/05/28/quick-fix-for-bootcamp/
categories:
  - Technology
  - Work
tags:
  - "OS X"
---
A Mini Server (two disks, no superdrive) became redundant in our setup, so I used it to test a few things. At the same time I needed Visual Studio, so I dedicated one of the drives to Windows 7. After installing it with bootcamp, the mini would reboot as Windows, but if I pressed option and selected OS X, and rebooted after having used OS X, I&#8217;d get a &#8220;no OS&#8221; flash and the mini would reboot, find no OS, reboot again and loop. If you ever get this problem, the fix is easy: Press the option key and select boot into OS X, then go to System Preferences, Startup disk, select your OS X disk, and press restart. It&#8217;ll now behave correctly and reboot into OS X at startup.