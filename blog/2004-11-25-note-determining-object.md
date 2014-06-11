---
title: Note determining object
author: niklas
layout: post
permalink: /archives/2004/11/25/note-determining-object/
enclosure:
  - |
    |
        http://niklas.saers.com/blog/wp-content/scale.jpg
        16958
        image/jpeg
        
        
categories:
  - Technology
---
I finished my first external Pure Data object, a <a href="http://niklas.saers.com/blog/wp-content/scale.tgz" title="Pd note determining object" class="broken_link">note determining object</a>. This object takes in the number of Hz a note is measured to be and outputs what note it is (the low A on a piano being 1, going up to 88), determining how many cent off it is and how many Hz extra there is (i.e, 415Hz = A flat (tone 47), one cent (minus 0.174Hz) low. Fourth output is a text with the note name, in this case Ab. This object uses equal temperament and was just an excercise for me to see if it can be done.

Here&#8217;s a screen shot:  
![Scale object screen shot][1]

The code is copyrighted Niklas Saers, 2004. I place the code under the two clause BSD license meaning I merely ask any redistribution, whether in source or binary, to reproduce this copyright.

 [1]: http://niklas.saers.com/blog/wp-content/scale.jpg