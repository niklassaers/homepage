---
title: 'Properties in Cocoa and OOA&#038;D'
author: niklas
layout: post
permalink: /archives/2012/09/14/properties-in-cocoa-and-ooad/
categories:
  - Discussion
  - iPhone dev
  - Technology
---
The past month or so I’ve reviewed a lot of code, and one issue is cropping up all the time: too much use of @property

Suppose we have the class AlbumViewController that extends UIViewController, and is used to display information about a music album. In the view, we want to display a title, and some artwork. So we make our storyboard, and drop a UILabel and UIImageView into a view controller of the class AlbumViewController. Now, how do we hook them up? We’ve got really four alternatives:

1. Instance variables in the interface declaration

<img src="http://blog.saers.com/wp-content/uploads/2012/09/ooad1.png" alt="" title="ooad1" width="640" height="202" />

2. Properties in the interface declaration

<img src="http://blog.saers.com/wp-content/uploads/2012/09/ooad2.png" alt="" title="ooad2" width="755" height="199" />

3. Hidden properties

<img src="http://blog.saers.com/wp-content/uploads/2012/09/ooad3.png" alt="" title="ooad3" width="755" height="241" />

4. Instance variables in the implementation

<img src="http://blog.saers.com/wp-content/uploads/2012/09/ooad4.png" alt="" title="ooad4" width="563" height="308" />

Objective C, in Apple’s incarnation, doesn’t have any sense of private, protected and public variables and methods: everything is public.

Instance variables are accessible only to the class, and its subclasses.

Properties are accessible from any object that has a reference to the object that exposes these properties. This is the main reason for having properties. The second reason is if you want to have the getting or setting of a property to have some side-effects.

So, in the example above, if we choose properties, hidden or explicitly public, we invite other objects to manipulate these properties directly. Thus we need to inspect our interface: does it make sense to expose the UILabel and UIImageView directly? Can the class AlbumViewController handle that other objects will manipulate these views? Probably not.

Properties that would make sense, from a class interface perspective, would be setting the album title and artwork. Then you can keep the presentation of these as an implementation detail:  


<img src="http://blog.saers.com/wp-content/uploads/2012/09/ooad5.png" alt="" title="ooad5" width="652" height="208" />  


<img src="http://blog.saers.com/wp-content/uploads/2012/09/ooad6.png" alt="" title="ooad6" width="660" height="532" /> 

This way you have nice encapsulation, and thus make your class easier to use for the next person coming in to your project, or your self next week.

My issue with alternative #2 and #3 is that they are really the same: they expose the properties to the world, even though alternative #3 tries to obscure it a bit. If you write any kind of dynamic code using just the tiniest bit of class introspection, the methods will offer their service straight away. So unless your interface is to expose these properties, don’t use that. The only thing you’ve gotten extra out of this is having to ask people not to use your properties, and a slightly added cost to accessing your instance variables.

Alternative #1 is good if you want the instance variables to be available to subclasses, and make it clear that these should be considered. Again, there’s not all that much difference between this and alternative #4, but #1 is more explicit and readable, so it’s a great place if you expect it to be useful for subclasses.

Alternative #4 is my preference for everything that is just something I need to get my implementation of this class done. And I really think it should be yours as well, and is what should be taught in basic iOS training. Unfortunately, surprisingly many go for alternative #3, cluttering the interface with lots and lots of “hidden” properties, that aren’t hidden at all, especially not at runtime.

So to sum up: think about your interface and what you want to expose to the world. Expose only this, keep everything else as an implementation detail, unless you expect the class to be subclassed. Then you can expose some of the instance variables in your interface as well.

As a final PS, we&#8217;re not doing the compiler any favour going into these details, it will get its work done anyhow. But this is so that we can keep a clear interface when communicating with other developers coming into the project, using the project, and to your future self that is working on the project.

Now that I’ve posted my view, I would love to hear your opinions, especially because I would love to hear some good arguments in favour of alternative #3.