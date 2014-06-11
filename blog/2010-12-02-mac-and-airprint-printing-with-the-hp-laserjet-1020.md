---
title: Mac and AirPrint printing with the HP LaserJet 1020
author: niklas
layout: post
permalink: /archives/2010/12/02/mac-and-airprint-printing-with-the-hp-laserjet-1020/
categories:
  - Technology
---
Today, let&#8217;s get your iPad/iPhone printing from the HP LaserJet 1020. The 1020 isn&#8217;t officially supported by Mac OS X but always has been able to print using the 1022 driver. In my case, I&#8217;ll have it connected via an Airport Express, but this works fine also if it&#8217;s connected directly to your Mac. Having it connected to the Airport Express another place in my house just makes it more fun. <img src='http://blog.saers.com/wp-includes/images/smilies/icon_wink.gif' alt=';-)' class='wp-smiley' /> 

First of all, we need to have [AirPrint Hactivator][1] (make sure that you&#8217;re running OS X 10.6.5 or later and have iTunes 10.1 installed) installed to do iOS&#8217; AirPrint. Leave that to last and you have to remove and add your printer once more, and we don&#8217;t want that.

Then [get the drivers from Apple][2] (~350mb download, ~560mb installed) and install them.

Finally, have the printer connected to the Airport Express (or your Mac) and turned on. Go to System Preferences, and hit the &#8216;+&#8217; button on the lefthand side. Select your printer (which will have &#8216;Kind&#8217; say &#8216;Bonjour&#8217; if it&#8217;s connected to the Airport Express, or &#8216;USB&#8217; if it&#8217;s connected to your Mac via USB). Select the printer (HP LaserJet 1020), in the &#8216;Print Using&#8217; dialog, select &#8216;Select Printer Software&#8217;, and select &#8216;HP LaserJet 1022, 1.3.0.261&#8242;, not any of the Gutenprint versions. The 1022 printer is virtually the same but also has a network interface of its own. When you&#8217;ve selected that, hit &#8216;Add&#8217; to finish adding your printer.

Congratulations, you can now print from your Mac and your iOS devicie! <img src='http://blog.saers.com/wp-includes/images/smilies/icon_smile.gif' alt=':-)' class='wp-smiley' /> (assuming, of course, that your device is on the same network as your Mac is)

 [1]: http://netputing.com/airprinthacktivator/
 [2]: http://support.apple.com/kb/dl907