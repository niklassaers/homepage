---
title: Hidden Java pitfalls
author: niklas
layout: post
permalink: /archives/2011/03/17/hidden-java-pitfalls/
categories:
  - Technology
---
The kind of errors I hate the most are the ones you cannot even find in the documentation. When you get no compiler warnings, and even an incentive from your preferred auto-completion tool to go straight into them.

Todays such error is the following:

`byte[] buffer = /* something that fills the buffer with the contents of a string*/;<br />
String stringBuffer = new String(buffer, Charset.forName("UTF8"));`

What&#8217;s wrong here?? Compiles fine, looks fine&#8230;. [let&#8217;s read the doc][1]&#8230; fine. Except, as it turns out, for long buffers, it will truncate the string and add a trailing *&#8230;*. So you need to do something like this instead

`String stringBuffer = new String(buffer, 0, lengthOfBuffer, Charset.forName("UTF8"));`

That gives you a correct string, not truncated and not with a *&#8230;* at the end. \*sigh\*

 [1]: http://download.oracle.com/javase/6/docs/api/java/lang/String.html#String(byte[],%20java.nio.charset.Charset)