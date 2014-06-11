---
title: pyext for Pure Data
author: niklas
layout: post
permalink: /archives/2004/11/22/pyext-for-pure-data/
categories:
  - Technology
---
I decided I prefer writing normal logic in a language I&#8217;m used to, so I went looking for a Python-external for Pure Data. And sure enough, I found [Thomas Grill][1]&#8216;s [py/pyext][2] (built upon <a href="http://grrrr.org/ext/flext/index.html" class="broken_link">flext</a>, a C layer for Python externals). I didn&#8217;t figure out how to install the binaries (didn&#8217;t take the time to experiment) so I just compiled them up. Works great. <img src='http://blog.saers.com/wp-includes/images/smilies/icon_smile.gif' alt=':-)' class='wp-smiley' /> 

Writing externals for this is supersimple:

`
<pre>
class example(pyext._class):
  _inlets=2
  _outlets=1

  def _anything_1(self,args):
    print "inlet 2:",args
    self._outlet(1,1)

  def _anything_2(self,args):
    print "inlet 2:",args
    self._outlet(1,2)
</pre>
<p>`

This little code should be an external that prints out the argument it receives and sends the inlet number it received the signal on to the outlet.

 [1]: http://grrrr.org
 [2]: http://grrrr.org/ext/py/