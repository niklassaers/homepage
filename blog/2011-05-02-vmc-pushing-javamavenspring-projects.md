---
title: 'vmc push&#8217;ing Java/Maven/Spring projects'
author: niklas
layout: post
permalink: /archives/2011/05/02/vmc-pushing-javamavenspring-projects/
categories:
  - Technology
---
I&#8217;m just getting started with Cloud Foundry. So I grabbed Springs samples and compiled <a href="https://github.com/SpringSource/cloudfoundry-samples/wiki/Spring-hello-sample-application" class="broken_link">hello-spring-mongodb</a> doing &#8220;mvn package&#8221; and then &#8220;vmc push &#8211;no-start&#8221;. That got me:

``Would you like to deploy from the current directory? [Yn]: The input stream is exhausted.<br />
/Library/Ruby/Gems/1.8/gems/highline-1.6.1/lib/highline.rb:601:in `get_line'<br />
/Library/Ruby/Gems/1.8/gems/highline-1.6.1/lib/highline.rb:622:in `get_response'<br />
/Library/Ruby/Gems/1.8/gems/highline-1.6.1/lib/highline.rb:216:in `ask'<br />
/Library/Ruby/Gems/1.8/gems/vmc-0.3.10/lib/cli/commands/apps.rb:369:in `push'<br />
/Library/Ruby/Gems/1.8/gems/vmc-0.3.10/lib/cli/runner.rb:426:in `send'<br />
/Library/Ruby/Gems/1.8/gems/vmc-0.3.10/lib/cli/runner.rb:426:in `run'<br />
/Library/Ruby/Gems/1.8/gems/vmc-0.3.10/lib/cli/runner.rb:14:in `run'<br />
/Library/Ruby/Gems/1.8/gems/vmc-0.3.10/bin/vmc:5<br />
/usr/bin/vmc:19:in `load'<br />
/usr/bin/vmc:19``

Probably that&#8217;s not what it should look like on a Mac, so I&#8217;m investigating the cause. Do shout out if you have an idea. I&#8217;ll update with my progress.

**Update**, question posted at <a href="http://support.cloudfoundry.com/entries/20072196-beginner-question" class="broken_link">http://support.cloudfoundry.com/entries/20072196-beginner-question</a>