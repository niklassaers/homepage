---
title: SQLite for the iOS SDK, two years later
author: niklas
layout: post
permalink: /archives/2011/03/29/sqlite-for-the-ios-sdk-two-years-later/
categories:
  - Technology
---
It&#8217;s been two years since I first wrote on using [SQLite for iPhone SDK][1]. Since then, iOS has come a long way, especially when it comes to storing data. But still, much remains the same. For instance, [FMDB][2] is still a great way of accessing [SQLite][3] databases directly, and if you&#8217;re most familiar with SQL and don&#8217;t want to learn too much new stuff (learning Objective-C and Cocoa can be enough by itself), this is a great way to write your first apps.

But, with iOS 3.0 came Core Data, and I was so happy when it did. [Marcus Zarra][4] wrote a [great book with PragProg][5] that I wholeheartedly recommend: it&#8217;s easy to read and thorough at the same time. I followed his workshop at NSConf &#8217;09, which was great, and I understand people have enjoyed <a href="http://ideveloper.tv/store/details?product_code=10003" class="broken_link">the videos</a> he and Scotty produced over at iDeveloper TV. I use Core Data in all my projects now, and its backed by SQLite, so I get a great mapping while having the performance of the database.

It being the year of the NoQL-databases, though, a post wouldn&#8217;t be complete without saying you can now ditch SQLite all together and use CouchDB. CouchBase have made a developer preview of <a href="https://github.com/couchbaselabs/iOS-Couchbase" class="broken_link">CouchDB for iOS</a> that I&#8217;m looking forward to try out. CouchDB has great replication, but I still need to learn more about how to handle security and access to data so to not give all my application users the keys to the &#8220;castle&#8221;.

Happy coding <img src='http://blog.saers.com/wp-includes/images/smilies/icon_smile.gif' alt=':-)' class='wp-smiley' />

 [1]: http://blog.saers.com/archives/2008/03/14/sqlite-for-iphone-sdk/
 [2]: http://flyingmeat.com/free/
 [3]: http://sqlite.org/
 [4]: http://www.zarrastudios.com/ZDS/Home/Home.html
 [5]: http://pragprog.com/titles/mzcd/core-data