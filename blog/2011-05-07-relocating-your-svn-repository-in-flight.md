---
title: Relocating your svn repository in-flight
author: niklas
layout: post
permalink: /archives/2011/05/07/relocating-your-svn-repository-in-flight/
categories:
  - Technology
---
Once upon a time I used a beanstalk repository in http mode. By that I mean I had it checked out from a http:// address, rather than the usual svn+ssh:// because Beanstalk didn&#8217;t support svn+ssh:// . Since then, no-one had touched the project, but today I wanted to do some changes. I went ahead to make them, and before committing I did a &#8220;svn up&#8221; just in case. It told me:

`svn: Repository moved permanently to 'https://xxx.svn.beanstalkapp.com/project'; please relocate`

Beanstalk had deprecated http-mode. Sounds like a good idea, really, I don&#8217;t remember why I was using http in the first place. But, if you, like me, have used SVN for a long time without really learning it, and get into the same pickle, this&#8217;ll be for you. To relocate, simply run

`svn switch --relocate http://xxx.svn.beanstalkapp.com/project https://xxx.svn.beanstalkapp.com/project`

That&#8217;s it. A &#8220;svn up&#8221; and &#8220;svn commit&#8221; later, the new changes are checked in.