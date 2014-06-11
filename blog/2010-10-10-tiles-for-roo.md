---
title: Tiles for Roo
author: Niklas
layout: post
permalink: /archives/2010/10/10/tiles-for-roo/
categories:
  - 'Roo &amp; Tiles'
---
I love [Roo][1]! [Ben Alex][2] and his team have made a great job making starting a Spring project a breeze. However, I&#8217;ve shied away from using Java for XHTML/JS/CSS since 2003, so while I know the underlying technologies with Roo (JPA, the databases, Spring, JUnit, Tomcat, etc etc) I don&#8217;t know [Apache Tiles][3] at all. So I figured I&#8217;d like to learn it, at least until Roo 1.1 hits in a few weeks, when I&#8217;ll probably want to learn [GWT][4]. <img src='http://blog.saers.com/wp-includes/images/smilies/icon_wink.gif' alt=';-)' class='wp-smiley' /> Stay tuned&#8230;

So, for learning this I&#8217;m going to make a project I&#8217;ve been planning ever since I released my awesome tuner for early music musicians: [Well Tempered for the iPhone][5]:  Open Temperament. It&#8217;s going to be an open database for tuning temperaments. So, first step, register the domain (let&#8217;s hope this isn&#8217;t going to be one of those many great ideas that are parked on a domain due to lack of time <img src='http://blog.saers.com/wp-includes/images/smilies/icon_wink.gif' alt=';-)' class='wp-smiley' /> ), done, and let&#8217;s get the basic Roo script up:

> project &#8211;topLevelPackage net.opentemperament  
> persistence setup &#8211;provider OPENJPA &#8211;database HYPERSONIC_PERSISTENT
> 
> entity &#8211;class ~.entities.Family &#8211;testAutomatically  
> field string &#8211;fieldName name
> 
> entity &#8211;class ~.entities.Temperament &#8211;testAutomatically  
> field string &#8211;fieldName title  
> field string &#8211;fieldName description  
> field string &#8211;fieldName originalAuthor  
> field reference &#8211;type ~entities.Family &#8211;fieldName family
> 
> entity &#8211;class ~.entities.OnlineUser  
> field string &#8211;fieldName fullname  
> field string &#8211;fieldName email  
> field reference &#8211;class ~.entities.Temperament &#8211;fieldName onlineAuthor &#8211;type ~.entities.OnlineUser
> 
> entity &#8211;class ~.entities.Note &#8211;testAutomatically  
> field string &#8211;fieldName name  
> field reference &#8211;type ~.entities.Note &#8211;fieldName enharmonicTwin  
> field number &#8211;fieldName indexFromA &#8211;type java.lang.Integer
> 
> field reference &#8211;fieldName startingNote &#8211;type ~.entities.Note &#8211;class ~.entities.Temperament
> 
> entity &#8211;class ~.entities.Comma &#8211;testAutomatically  
> field string &#8211;fieldName name &#8211;notNull  
> field number &#8211;fieldName ratio &#8211;type java.lang.Double  
> field number &#8211;fieldName ratioInCents &#8211;type java.lang.Double  
> field reference &#8211;type ~.entities.Comma &#8211;fieldName alias
> 
> enum type &#8211;class ~.enums.IntervalType  
> enum constant &#8211;name MinorSecond  
> enum constant &#8211;name MajorSecond  
> enum constant &#8211;name MinorThird  
> enum constant &#8211;name MajorThird  
> enum constant &#8211;name PureFourth  
> enum constant &#8211;name PureFifth
> 
> entity &#8211;class ~.entities.Deviation &#8211;testAutomatically  
> field reference &#8211;type ~.entities.Note &#8211;fieldName lowestNote &#8211;notNull  
> field enum &#8211;type ~.enums.IntervalType &#8211;fieldName intervalType &#8211;notNull  
> field reference &#8211;type ~.entities.Comma &#8211;fieldName deviationType &#8211;notNull  
> field number &#8211;fieldName deviationValue &#8211;type java.lang.Double
> 
> field set &#8211;class ~.entities.Temperament &#8211;element ~.entities.Deviation &#8211;fieldName deviations
> 
> controller all &#8211;package ~.web  
> logging setup &#8211;level DEBUG  
> security setup
> 
> json add &#8211;class ~.entities.Family  
> json add &#8211;class ~.entities.Temperament  
> json add &#8211;class ~.entities.OnlineUser  
> json add &#8211;class ~.entities.Note  
> json add &#8211;class ~.entities.Comma  
> json add &#8211;class ~.entities.Deviation
> 
> perform eclipse  
> perform test

 [1]: http://www.springsource.org/roo
 [2]: http://www.springsource.com/people/balex
 [3]: http://tiles.apache.org/
 [4]: http://code.google.com/webtoolkit/
 [5]: http://tinyurl.com/WellTempered