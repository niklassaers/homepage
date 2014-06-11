---
title: CozyRoc SSIS+
author: niklas
layout: post
permalink: /archives/2008/01/17/cozyroc-ssis/
categories:
  - Technology
---
One of my main gripes with Microsoft SSIS is that there is no way to reuse logic. In my data integration task I needed to do the same lookup and translation tasks (typically convert to upper case, replace &#8221; with &#8216;N/A&#8217;, look up column in side table and use the IDs from that table instead) many times, in my case when importing data from an Axapta database. CozyRoc got back to me and told me that they have released [an SSIS component][1] that includes new components for reusability of code and flows. Being a coder I had given up on SSIS and rewritten my work in C#/SQL, but next time I&#8217;m very much looking forward to using it.

 [1]: http://cozyroc.wordpress.com/2007/12/17/cozyroc-ssis-12-beta-2-released/