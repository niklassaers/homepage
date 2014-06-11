---
title: Converting OCUnit output to something Jenkins can understand
author: niklas
layout: post
permalink: /archives/2011/07/31/converting-ocunit-output-to-something-jenkins-can-understand/
categories:
  - iOS
---
I&#8217;m working on setting up my continuous integration system to work with Xcode. I&#8217;m using Jenkins on a separate Mac Mini, and I found [this great article by Christian Hedin][1] where he introduces his [ocunit2junit.rb][2] utility that converts the output of OCUnit to something looking like JUnit, thus making it easier for Jenkins to pick integrate with the build.

 [1]: http://blog.jayway.com/2010/01/31/continuos-integration-for-xcode-projects/
 [2]: git://github.com/ciryon/OCUnit2JUnit.git