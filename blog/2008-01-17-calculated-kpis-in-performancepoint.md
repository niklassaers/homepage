---
title: Calculated KPIs in PerformancePoint
author: niklas
layout: post
permalink: /archives/2008/01/17/calculated-kpis-in-performancepoint/
categories:
  - Technology
---
What bugs me very much about working with KPIs in PerformancePoint&#8217;s Dashboard is that you cannot do simple calculations. For instance, I have a sales cube that has the measures unit cost and price the unit was sold for. I would like to say that a loss (price/cost < 1) makes the KPI red, a <20% margin makes it yellow and >=20% is green. In Excel this would be trivial: choose the price column, type &#8216;/&#8217; and choose the cost column: voila, you&#8217;ve got your calculation. Not so with Dashboard. As Rex Parker from Microsoft writes in the [PerformancePoint Team Blog][1] [you&#8217;ll have to write an MDX query][2]. I don&#8217;t believe MDX is for the average business person that PerformancePoint Dashboard is aimed at. <img src='http://blog.saers.com/wp-includes/images/smilies/icon_smile.gif' alt=':-)' class='wp-smiley' /> But until MS puts together an expression tool that is as least as understandable as Excel, Scott Larson has put together <a href="http://blogs.interknowlogy.com/scottlarson/archive/2007/11/08/22472.aspx" class="broken_link">a nice little tutorial</a> to show how to write such expressions with MDX.

I agree with Scott&#8217;s comment: *I&#8217;m beginning to suspect that the use of PerformancePoint, at least in it&#8217;s early releases, will require at least functional knowledge of MDX and PerformancePoint Expression Language (PEL) for PerformancePoint Planning, neither of which are exactly business-user friendly*

 [1]: http://blogs.msdn.com/performancepoint/
 [2]: http://blogs.msdn.com/performancepoint/archive/2008/01/09/band-by-stated-score.aspx