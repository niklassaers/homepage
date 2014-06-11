---
title: Auto-mount external drives on OS X
author: niklas
layout: post
permalink: /archives/2007/08/09/auto-mount-external-drives-on-os-x/
categories:
  - Technology
---
Run the following as root to make disks auto-mount during system startup. I use this to have an external disk to put my Tomcat, JBoss and MySQL logfiles on  
`defaults write /Library/Preferences/SystemConfiguration/autodiskmount AutomountDisksWithoutUserLogin -bool true`