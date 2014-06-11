---
title: In defense of Dart
author: niklas
layout: post
permalink: /archives/2011/10/18/in-defense-of-dart/
categories:
  - Technology
---
Ok, everyone, let&#8217;s all calm down. There&#8217;s been so many blog posts and podcast debates all over the net about what&#8217;s wrong with [Dart][1]. The only problem with Dart, the way I see it, is that Google is too good at marketing: too much hype before we got to see the product.

The way I see Dart, it&#8217;s another language for doing client-side web application programming. Luckily, it&#8217;s not another Flash or Silverlight with its plethora of languages. It would like to be a part of the browser, but for now it contends itself to being a language that compiles down to JavaScript. That puts it together with <a href="http://jashkenas.github.com/coffee-script/" class="broken_link">CoffeeScript</a> and [Objective-J][2], to name but a few. <a href="https://github.com/jashkenas/coffee-script/wiki/List-of-languages-that-compile-to-JS" class="broken_link">See a long list here</a>. As you can see from the list, this is nothing new.

The only problem with Dart is that everyone had their hopes up for the perfect language that would contain all their pet features. And of course, the set of preferred combinations is probably as big as the number of developers in the world.

What I find to be one of the strong points of Dart is that it uses the [actor model][3] as its concurrency model. I remember it well from my days at uni, thinking it was a model leading to waaay to much overhead. Surely, the [Smalltalk][4] guys must be mad! But as time has given us more power, I&#8217;ve come to believe that this is a great model, which has lead me to [Scala][5] and [Akka][6]. Although [GCD][7] is very powerful, I find myself looking into using actors in my language of choice, [Objective-C][8], all the time.

So where does Dart go from here? Well, that depends on what kind of backing it has from Google. Google hasn&#8217;t been very clear on how well the Dart support is grounded in the organization. But if it gains a good community of libraries and evolves a good community, it could become the preferred way of writing Android apps, letting developers re-use code for their web-app and mobile app. If not, it could become shelved like [Go][9].

Personally, on this front I&#8217;ll brush up my ancient JavaScript skills and look more at [SproutCore][10] the next couple of weeks, probably along with CoffeeScript. Then in a month or two, if there is any momentum going for Dart, I&#8217;ll probably write something where I can exploit Darts actor model and see if we become good friends. 2011 will be interesting still. <img src='http://blog.saers.com/wp-includes/images/smilies/icon_smile.gif' alt=':-)' class='wp-smiley' />

 [1]: http://www.dartlang.org/
 [2]: http://cappuccino.org/learn/tutorials/objective-j-tutorial.php
 [3]: http://en.wikipedia.org/wiki/Actor_model
 [4]: http://www.smalltalk.org
 [5]: http://www.scala-lang.org/
 [6]: http://akka.io/
 [7]: http://en.wikipedia.org/wiki/Grand_Central_Dispatch
 [8]: http://en.wikipedia.org/wiki/Objective-C
 [9]: http://golang.org/
 [10]: http://www.sproutcore.com/