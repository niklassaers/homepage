---
title: WSMakeStubs, a nightmare?
author: niklas
layout: post
permalink: /archives/2008/05/29/wsmakestubs-a-nightmare/
categories:
  - Technology
---
I&#8217;m not quite sure of the state of things, but fact is I&#8217;ve had lots of problems with WSMakeStubs, and I&#8217;m looking for alternatives. WSMakeStubs makes stubs for webservices in Objective C (and C++, but I haven&#8217;t used that). WikiBooks have an excelent article on what to watch out for and tips when using WSMakeStubs, you can [check it out here][1]. I&#8217;m seriously considering just wrapping the SOAP XML myself and doing some XPath on the result, but come on, Apple, it shouldn&#8217;t have to be that hard. My bugreport (#5944524) hasn&#8217;t been touched, and I guess for a good reason: Apple must have zillions of them, it seems everywhere I hear about WSMakeStubs I hear how it&#8217;s not working. I hope they put this tool into shape quickly, it would be a real benefit, especially with all the iPhone programming going on. Just look at how easy this is in Visual Studio, how easy [Axis2][2] makes it. Even PHP libraries like [nusoap][3] are easy to use compared to WSMakeStubs. Apple, I&#8217;m sooo looking forward to WSMakeStubs 2.0 <img src='http://blog.saers.com/wp-includes/images/smilies/icon_smile.gif' alt=':-)' class='wp-smiley' />

 [1]: http://en.wikibooks.org/wiki/Programming:WebObjects/Web_Services/Web_Service_Provider#Consuming_with_WebServicesCore.framework
 [2]: http://ws.apache.org/axis2/
 [3]: http://sourceforge.net/projects/nusoap/