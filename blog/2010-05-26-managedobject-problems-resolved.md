---
title: managedObject problems resolved
author: Niklas
layout: post
permalink: /archives/2010/05/26/managedobject-problems-resolved/
categories:
  - iPhone dev
  - Technology
tags:
  - coredata
---
I&#8217;ve been having some issues using the

> <pre>- (NSManagedObjectModel *)managedObjectModel</pre>

<pre>function. First it didn't load well, but <a title="Core Data: fetch an NSManagedObject by its properties" href="http://stackoverflow.com/questions/2827070/core-data-fetch-an-nsmanagedobject-by-its-properties/2873858#2873858">Marcus Zarra helped me out there on Stack Overflow</a>. The funny thing was of course that up until now, it'd worked great on the phone but not the simulator. That solved, it stopped working on my phone, but I was working so much in the simulator I didn't pay a lot of attention to it.</pre>

<pre>Anyway, today I wanted to have that figured out, and I came across <a title="Core Data Migration Problems?" href="http://iphonedevelopment.blogspot.com/2009/09/core-data-migration-problems.html">this great post by Jeff Lamarche</a>, and while it didn't explain to me why I had multiple versions on my phone but not my simulator, even after I had wiped the application and application data completely, it allowed me to load the correct model. So now everything is running smoothly and the app is coming along great.</pre>

<pre>If you've been having the same kinds of issues, I hope these links help you as much as they did me.</pre>