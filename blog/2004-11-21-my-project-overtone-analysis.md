---
title: 'My project &#8211; Overtone analysis'
author: niklas
layout: post
permalink: /archives/2004/11/21/my-project-overtone-analysis/
categories:
  - Technology
---
I think it&#8217;s about time I introduce my project:

I want to use Pd to extract the overtones of the recorder and train a neural network to identify what kind of sound (broad, thin, glass-ish, etc) I&#8217;m playing. I want to use this to control VST processors to shape the sound I play. And after the network is trained, I want to the analysis and processing in real-time.

At the moment I&#8217;m reading up on alternatives to FFT to separate out overtones, and I&#8217;ve made a prototype as a proof-of-concept kind of thing using fiddle~ to identify the overtones in hz and bp~ to separate them out as audio streams. It still has lots of problems such as artifacts, sound degeneration and latency issues. But it gets the job done, so I&#8217;m optimistic.

I&#8217;d prefer to do my project as a part of a Ph.D, but since Ph.D funding takes a while to find, I&#8217;m already starting. Can&#8217;t wait for formalities. <img src='http://blog.saers.com/wp-includes/images/smilies/icon_smile.gif' alt=':-)' class='wp-smiley' /> When I&#8217;ve checked that it is ok to release code here I&#8217;ll post some as I progress.