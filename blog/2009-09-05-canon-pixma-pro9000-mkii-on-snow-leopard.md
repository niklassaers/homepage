---
title: Canon Pixma Pro9000 MkII on Snow Leopard
author: niklas
layout: post
permalink: /archives/2009/09/05/canon-pixma-pro9000-mkii-on-snow-leopard/
categories:
  - Photography
  - Technology
---
Recently I bought a Canon Pro9000 MkII printer. About a week later, Snow Leopard was released. I decided I wasn&#8217;t too fond of the drivers that came with Snow Leopard and wanted the &#8220;official&#8221; ones. However, they won&#8217;t install on anything beyond Leopard, unless you do some tweaking. If tweaking is what you&#8217;d like, you&#8217;ve come to the right place. In this little post, we&#8217;ll install them.

First, use Disk Utility to create a new image that&#8217;s read/write enabled from the CD. Select the CD (CANON\_IJ) from within Disk Utility and hit the &#8220;New Image&#8221; button at the top of the window, between &#8220;Enable Journaling&#8221; and &#8220;Convert&#8221;. Select &#8220;read/write&#8221; from Image format and save the image to your desktop. You should get a window titled &#8220;Disk Utility Progress&#8221; saying Creating Image and Reading CANON\_IJ. Let it finish

Having done that, eject your CD, and be sure you have your image mounted. (Double-click it if it&#8217;s not). Open your terminal, and write

<pre>cd /Volumes/CANON_IJ
find ./ -name getosversion -print
</pre></p> 

That should give you:

<pre>.//Set/Printer Driver/Pro9000 Mark II series/PrinterDriver_Pro9000II series_071700.pkg/Contents/Resources/getosversion
.//Set/Printer Driver_Alt/Pro9000 Mark II series/PrinterDriver_Pro9000II series_101800.pkg/Contents/Resources/getosversion
</pre></p> 

Now replace these files with a string saying your OS is version 10.5.8:

<pre>cat > /tmp/getosversion
#!/bin/sh
echo 1058
</pre>

press ctrl-d 

<pre>chmod a+x /tmp/getosversion
cp /tmp/getosversion "Set/Printer Driver/Pro9000 Mark II series/PrinterDriver_Pro9000II series_071700.pkg/Contents/Resources/getosversion"
mv /tmp/getosversion "Set/Printer Driver_Alt/Pro9000 Mark II series/PrinterDriver_Pro9000II series_101800.pkg/Contents/Resources/getosversion"
</pre>

You&#8217;ll get an &#8220;Operation not permitted&#8221; when mv tries to set the file owner, don&#8217;t worry about that. 

Voila, you&#8217;re good to go. Run the setup from your image. You&#8217;ll get a warning saying the OS version is unsupported, but we&#8217;ve just made it so that it will complete correctly. So just click OK when you get the warning, install the printer as you would before and enjoy