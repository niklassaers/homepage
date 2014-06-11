---
title: iTunes duplicates
author: niklas
layout: post
permalink: /archives/2008/01/02/itunes-duplicates/
categories:
  - Technology
---
Not quite happy with any of the programs I found to identify iTunes duplicates, I spent an hour making my own (beats tracking down duplicates. <img src='http://blog.saers.com/wp-includes/images/smilies/icon_smile.gif' alt=':-)' class='wp-smiley' /> ) I thought I&#8217;d share it with you. It&#8217;s my first attempt at using OS X&#8217; ScriptingBridge and written in Python. I have no clue if it runs out of the box, I suppose you should have Developer Tools installed. It&#8217;s not the fastest beast either, and Python and iTunes both use 50% CPU. But it gets the job done. <img src='http://blog.saers.com/wp-includes/images/smilies/icon_smile.gif' alt=':-)' class='wp-smiley' /> If you wonder why I give so many parameters to the track class I should say that I plan on reusing it to do some more iTunes housekeeping. The script will mark all the duplicates with one star. Then I can round them up and delete them afterwards.

<pre>import struct
from ScriptingBridge import *

class Track:
   def __init__(self, name, album, artist, size, length, track, path):
     self.name= self.str(name)
     self.album= self.str(album)
     self.artist= self.str(artist)
     self.size = size
     self.length= self.str(length)
     self.track = track
     self.path= self.str(path)

   def str(self, s):
     try:
       return s.encode('utf-8')
     except:
       return "N/A"

   def equals(self, t):
     test = t.name == self.name
     test = test and t.album == self.album
     test = test and t.artist == self.artist
     test = test and t.size == self.size
     test = test and t.length == self.length
     test = test and t.track == self.track
     return test

   def __eq__(self, t):
     return self.equals(t)

iTunes = SBApplication.applicationWithBundleIdentifier_("com.apple.iTunes")
lib = iTunes.sources()[0].playlists()[0]
tracks = lib.tracks()
filetracks = lib.elementArrayWithCode_(struct.unpack('>L', 'cFlT')[0])

Tracks = []
Duplicates = []
duplicates = []
for track in filetracks:
  t = Track(track.name(), track.album(), track.artist(), track.size(), track.time(), track.trackNumber(),track.location())
  if(Tracks.__contains__(t)):
    Duplicates.append(t)
    duplicates.append(track)
  else:
    Tracks.append(t)

print len(duplicates)

# Deal with duplicates
for track in duplicates:
   track.setRating_(20)
</pre>