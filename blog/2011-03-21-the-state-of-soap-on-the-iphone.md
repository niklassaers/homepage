---
title: The state of SOAP on the iPhone
author: niklas
layout: post
permalink: /archives/2011/03/21/the-state-of-soap-on-the-iphone/
categories:
  - Technology
---
I&#8217;ve been developing apps for the iPhone since the early betas of iOS 2.0, and one of the things I&#8217;d like back then was to use SOAP services. Back then, Apple had an old, half-implemented command-line program called wsmakestubs that you could use to generate some stubs that half worked. That program has not been updated, nor has any more SOAP support been added to iOS itself.

What has changed, though, is the eco-system. First off all, we can talk about it and share experiences. Secondly, people have made and shared interesting stuff. One of my favourites is [SudzC][1]. It&#8217;s very interesting, but has been stuck in alpha for a while. Commercial offerings such as [WSClient++][2] are also interesting, but what I&#8217;ve found is that, for the most part, I don&#8217;t need all this support I was looking for.

Hand-crafting the XML is easy enough. Just grab [SOAP Client][3] and fire of a request, then get the raw request and modify that XML. Likewise, check out the raw response and use XPath to grab the parts of the answer you need. Fire off the request with [ASIHttpRequest][4] just to make it easier. All in all, getting hooked up to your SOAP service shouldn&#8217;t take long.

For examples of using XPath, check out [this example at Stack Overflow][5]. 

So back to the topic, the state is that it&#8217;s not well supported, but it doesn&#8217;t need to. Doing it yourself has become easy with great supporting frameworks for requests and XML handling in the iOS eco system.

 [1]: http://sudzc.com/
 [2]: http://wsclient.neurospeech.com/tag/ios/
 [3]: http://ditchnet.org/soapclient/
 [4]: http://allseeing-i.com/ASIHTTPRequest/
 [5]: http://stackoverflow.com/questions/4792475/parsing-soap-result-using-touchxml-in-ios-sdk-ipad