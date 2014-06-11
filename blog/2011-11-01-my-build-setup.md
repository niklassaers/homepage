---
title: My build setup
author: niklas
layout: post
permalink: /archives/2011/11/01/my-build-setup/
categories:
  - iOS
  - Technology
---
Tomorrow I begin work at [Trifork][1]! <img src='http://blog.saers.com/wp-includes/images/smilies/icon_smile.gif' alt=':-)' class='wp-smiley' /> There I&#8217;ll be doing iOS development, so before I begin I thought I&#8217;d like to share a bit about how I do my development now.

First of all, I use GitHub and Beanstalk for source control, depending on what client the work is for (for my own projects, I use GitHub). Mercurial is nice, but git and svn just work with XCode, so I stick to that.

Since I have source control, I can have continuous delivery. For that I use Jenkins. Jenkins is not good enough. It&#8217;s not great. It&#8217;s not beautiful. It&#8217;s not intelligent, easy, friendly, intuitive, or all those other nice words. But it works! I use the Clang Scan-Build, Github OAuth, Github, Pre SCM BuildStep, Redmine, SICCI, SSH Slaves and Xcode integration plugins, even though I&#8217;d get most things done by just adding a shell script. That gives me a build per commit, which is nice and reliable and brings the pain forward. Jay pain! <img src='http://blog.saers.com/wp-includes/images/smilies/icon_wink.gif' alt=';-)' class='wp-smiley' /> 

Of course, having this infrastructure in place begs for tests. Now I think tests for iPhone applications suck. Bigtime! The reason is that I hate deployment cycles. It takes time, and that time I&#8217;d rather use writing code, thinking about the application, solving real problems for my customer, preferably before he knows about them. If not that, I&#8217;d rather drink coffee, do chores in my home, or clean my pipes, rather than waiting for build cycles. It&#8217;s just an enormous waste of time. And tests for iOS drain time, as there&#8217;s no such thing as a unit test for iOS. Everything is an integration test or a user acceptability test. You always fire up the entire application before running any test.

So now I have that rant done, it&#8217;s great that I can leave my tests to Jenkins. It will perform them, and the output will get converted to what looks like a JUnit test so that it can get picked up by Jenkins&#8217; tooling and be presented nicely. Jay! <img src='http://blog.saers.com/wp-includes/images/smilies/icon_smile.gif' alt=':-)' class='wp-smiley' /> 

Then we get to deployment. My clients communicate with me. A lot! This should be different like so, I changed my mind about this, I&#8217;ve found a bug if you do like this and that. It&#8217;s great! I love my users for this! It creates such a momentum! So how awful wouldn&#8217;t it be if I said &#8220;I&#8217;ll collect everything and give you a beta in three weeks&#8221;? Continuous delivery isn&#8217;t just delivery to me, it is to the users as well. For this I use [HockeyApp][2]. They&#8217;re a great bunch and really responsive, and while they just don&#8217;t support iOS 5 well enough yet, there is so much good there. My app gets auto-deployed up there and my client sees the new release, hits install and boom! Now he&#8217;s running the latest build! <img src='http://blog.saers.com/wp-includes/images/smilies/icon_smile.gif' alt=':-)' class='wp-smiley' /> Crash reports get sorted by build numbers, and the guys at HockeyApp have told me they&#8217;re working at making the crash reports even more awesome! Jay! <img src='http://blog.saers.com/wp-includes/images/smilies/icon_smile.gif' alt=':-)' class='wp-smiley' /> 

So how do I follow up on these things? I have to admit, I&#8217;m a cheapskate, so I use Redmine. I would use Basecamp, and I hope to be using it, it&#8217;s so awesome, but so far it&#8217;s not been worth the extra cost. The day it is, I&#8217;ll run and buy it quickly. My problem with Basecamp and Redmine? I just haven&#8217;t seen how I&#8217;d integrate it with my scrum sprints. Yet. I&#8217;m sure they both can, and I hope to learn from people that are wiser than me in this regard.

Finally, after a deployment to the appstore, I use Flurry to keep track of where my users are at, both in version of the app (why don&#8217;t they upgrade! This new version is awesome! I need to tell them more about it!) and the OS (really? They&#8217;re still on iOS 4?? iOS 5 has been out a month now! Oh well, not everyone is like me). Also, I&#8217;ve rolled my own crash reporting that, should I have failed horribly, the users can get in touch with me or the client, with a detailed log of what went wrong.

So, that&#8217;s my work setup this far, and I&#8217;m quite happy with it. It still needs better scrum integration. It&#8217;s still too many pieces that don&#8217;t talk sensibly together. But it&#8217;s getting better knit together, and I&#8217;m looking forward to seeing how Trifork does it, how I can improve based on what they have to teach, and how I can improve the way they&#8217;re doing it. It&#8217;s going to be great! Those guys are brilliant, and I love working with brilliant people.

Finally, if you&#8217;re in the Esbjerg area, working with iOS, get in touch with me. If you&#8217;d love to start working with iOS, get in touch with me! There&#8217;s an NSCoder Night coming up soon, biweekly I hope. <img src='http://blog.saers.com/wp-includes/images/smilies/icon_smile.gif' alt=':-)' class='wp-smiley' />

 [1]: http://www.trifork.com
 [2]: http://www.hockeyapp.net/