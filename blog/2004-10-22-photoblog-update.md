---
title: Photoblog update
author: niklas
layout: post
permalink: /archives/2004/10/22/photoblog-update/
categories:
  - Blogs
---
Right, I&#8217;ve ended up adding a Photoblog category to my blog. I&#8217;m sure someone will hold the definition against me and scream some bad language in my face, but hey, this works for me.

The four options as I saw it was [keep using][1] Gallery as a Photoblog, install a separate blog for Photoblogging, tweak my WordPress template or make a WordPress plugin for Photoblog posts. The first two could be &#8220;integrated&#8221; through building a little script that would take the different RSS feeds and make them into one. The last one would probably be the nicest as all about the post would go into the post text in the database. Only problem is: my PHP server doesn&#8217;t support exif and as I&#8217;ve just moved my server I couldn&#8217;t really be bothered to redo the PHP installation right now.

So I went for option three: tweak my template. This consisted of checking when a post was from the Photoblog category and then present it like I want my photoblog entries presented, which for now is with SOME exif-data (my Canon EOS 20D gives by far too much uninteresting data, so I took only out what I thought to be interesting enough to share. If you want the rest, grab the picture and extract them yourself <img src='http://blog.saers.com/wp-includes/images/smilies/icon_smile.gif' alt=':-)' class='wp-smiley' /> ).

graphics/exiftags from FreeBSD&#8217;s ports collection was installed, index.php and archive.php got a little extra with:

<div class="code">
  < ?php if(the_category_ID(false)==13) { include "photoblog.php"; } else { ?><br /> </>
</div>

and photoblog.php was basically:

<div class="code">
  $content=get_the_content();<br /> $src=strpos($content, &#8220;src&#8221;);<br /> $start=strpos($content, &#8220;&#8221;", $src);<br /> $end=strpos($content, &#8220;&#8221;", $start+1);<br /> $src=substr($content, $start+1, $end-$start-1);<br /> $src=str_replace(&#8220;.sized&#8221;, &#8220;&#8221;, $src);<br /> echo $content;</p> <p>
    $sha1 = sha1($src);<br /> $cache = ABSPATH . &#8220;wp-content/cache/&#8221;.$sha1;<br /> if(file_exists($cache)) { echo &#8220;<pre>&#8221;; include($cache); echo &#8220;</pre>&#8221;; }<br /> else {<br /> exec(&#8220;/usr/bin/fetch -q -o /tmp/&#8221;.$sha1.&#8221; $src&#8221;);<br /> exec(&#8220;/usr/local/bin/exiftags < /tmp/".$sha1." > $cache.tmp&#8221;);<br /> exec(&#8220;/bin/rm /tmp/&#8221;.$sha1);<br /> exec(&#8220;/usr/bin/grep Created $cache.tmp >> $cache&#8221;);<br /> exec(&#8220;/usr/bin/grep Exposure $cache.tmp | /usr/bin/grep -v Mode >> $cache&#8221;);<br /> exec(&#8220;/usr/bin/grep ISO $cache.tmp >> $cache&#8221;);<br /> exec(&#8220;/usr/bin/grep Focal $cache.tmp >> $cache&#8221;);<br /> exec(&#8220;/usr/bin/grep Lens $cache.tmp >> $cache&#8221;);<br /> exec(&#8220;/bin/rm $cache.tmp&#8221;);<br /> echo &#8220;<pre>&#8221;; include($cache); echo &#8220;</pre>&#8221;;<br /> }<br /> ?><br /> </></div> <p>
      I&#8217;ll add some presentation later for the more minimalistic approach. But right now, I think it looks quite good. Of course, an option five: auto-blog my entries to Gallery&#8217;s Photoblog gallery would&#8217;ve been even better, but for now this is all right.
    </p>

 [1]: /photos/Photoblog