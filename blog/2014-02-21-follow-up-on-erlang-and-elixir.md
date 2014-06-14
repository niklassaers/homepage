---
title: Follow-up on Erlang and Elixir
author: niklas
layout: post
permalink: /archives/2014/02/21/follow-up-on-erlang-and-elixir/
categories:
  - Discussion
tags:
  Letter
---
Dear John,  
  
thanks for [the great show (ATP)][1], I look forward to every episode the three of you do. In [the episode I listened to today (#53)][2] you guys talked about ObjC moving forward, and you mentioned Erlang a few times.


Two small disclaimers first, (1) I&#8217;m very new in the world of Erlang, and (2) [the company I work][3] for has <a href="https://www.erlang-solutions.com" class="broken_link">subsidiaries</a> that only focus on Erlang, and shares in <a href="https://www.erlang-solutions.com" class="broken_link">companies</a> whose [products][4] are built on top of Erlang. I like to believe I&#8217;m not influenced by this, but I **am** influenced, amongst others, by <a href="https://github.com/krestenkrab" class="broken_link">my CTO</a>s passion for the ecosystem.

Erlang is two things: a VM called BEAM, and [a language][5]. The language is not to my taste, but I really like the VM. Lucky for me, there is a new language called [Elixir][6] that runs on the Erlang VM as a first class citizen.

What I really like with writing for this ecosystem is that it launches a ton of [green threads][7] instead of <a href="https://developer.apple.com/library/ios/documentation/Performance/Reference/GCD_libdispatch_Ref/Reference/reference.html" class="broken_link">GCD</a> threads, and these processes do true (shared nothing) message sending between them. The [actor model][8] is back!

Elixir has other fun stuff too, such as piping function calls as if they were commands in the terminal. So far, I find myself writing a bunch of pattern matching for the work I want it to do, in a more terse yet easy-to-read way than I&#8217;m used to coming from ObjC and the usual suspects of languages before that.

I think you&#8217;d find it interesting diving into the Elixir and Erlang VM combination. The take-away I&#8217;ve got that I&#8217;d love to bring back to ObjC would to be (1) even tighter on making everything immutable, (2) introduce green threads where for instance singletons can live, and (3) make a objc_msgSend that sends messages between threads not containing pointers to data, but an actual message, and having the sending process being able to continue with its logic until it needs the answer back where it can block and wait if there is no reply yet.

This was a bit longer than a 140 character tweet, but there you go. Oh, and to tie this together with the [news][9], I only noticed Whatsapp because they sponsor conferences and give talks on how they built their backend in Erlang.

 [1]: http://atp.fm
 [2]: http://atp.fm/episodes/53-theres-gonna-be-some-flapping
 [3]: http://www.trifork.com
 [4]: http://basho.com/riak/
 [5]: http://en.wikipedia.org/wiki/Erlang_(programming_language)
 [6]: http://elixir-lang.org
 [7]: http://en.wikipedia.org/wiki/Green_threads
 [8]: http://en.wikipedia.org/wiki/Actor_model
 [9]: http://techcrunch.com/2014/02/19/facebook-buying-whatsapp-for-16b-in-cash-and-stock-plus-3b-in-rsus/