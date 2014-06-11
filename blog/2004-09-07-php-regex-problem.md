---
title: PHP regex problem
author: niklas
layout: post
permalink: /archives/2004/09/07/php-regex-problem/
categories:
  - Work
---
PHP allows the use of the PCRE library, but PHP5 comes with an interesting, undocumented twitch: [You have to add &#8211;with-pcre-regex][1] if you want to use preg_match(), a quite commonly used function. With PHP4, all you did was &#8211;with-pcre and you got the whole package, and the &#8211;with-pcre-regex is undocumented in the configure program of PHP5 which is where people look for this.

 [1]: http://bugs.php.net/bug.php?id=29158&edit=1