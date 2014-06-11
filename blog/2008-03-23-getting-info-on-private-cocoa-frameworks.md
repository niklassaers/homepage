---
title: Getting info on private Cocoa frameworks
author: niklas
layout: post
permalink: /archives/2008/03/23/getting-info-on-private-cocoa-frameworks/
categories:
  - Technology
---
[class-dump][1] is a great tool for getting information about how private frameworks work that you may want to use. For example, iPhotoAccess.framework gave among other classes the following:  
`<br />
@interface Base64 : NSObject<br />
{<br />
}</p>
<p>+ (id)stringForBase64:(id)fp8;<br />
+ (id)base64ForString:(id)fp8;</p>
<p>@end<br />
`

 [1]: http://www.codethecode.com/projects/class-dump/