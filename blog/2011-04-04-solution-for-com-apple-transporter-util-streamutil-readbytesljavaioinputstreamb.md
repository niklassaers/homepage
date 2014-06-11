---
title: 'Solution for &#8220;com.apple.transporter.util.StreamUtil.readBytes(Ljava/io/InputStream;)[B&#8221;'
author: niklas
layout: post
permalink: /archives/2011/04/04/solution-for-com-apple-transporter-util-streamutil-readbytesljavaioinputstreamb/
categories:
  - iOS
---
March 27th I had this problem that whenever I submitted an app to the app store with the App Loader or Xcode, that would pass verification mind you, I got an error: &#8220;com.apple.transporter.util.StreamUtil.readBytes(Ljava/io/InputStream;)[B&#8221; I wrote Apple to tell them about it, but I got an error due to a disk being full, so I figured nobody&#8217;s perfect, it&#8217;s probably a disk-full error, and tried the next day. The 28th, no luck either. Wrote them a mail. Didn&#8217;t hear from them by the 31st, so wrote another mail. But by now, results had began to come up on my radar via Google, so I thought I&#8217;d share what I found.

With Xcode 4 it seems many people are having this problem. The advice I found first was to [downgrade to Xcode 3.x or Application Loader 1.3][1], but by this time Xcode 4.0.1 was out, and for some reason I&#8217;d missed installing it on my dev box.

After installing XCode 4.0.1, this problem was solved and an updated version of Well Tempered is now awaiting approval. <img src='http://blog.saers.com/wp-includes/images/smilies/icon_smile.gif' alt=':-)' class='wp-smiley' />

 [1]: http://stackoverflow.com/questions/5289784/application-loader-error-ios-upload