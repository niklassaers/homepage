---
title: Fusion Drive on iMac 2011
author: niklas
layout: post
permalink: /archives/2012/11/19/fusion-drive-on-imac-2011/
categories:
  - Technology
---
Last week I made sure I have good backups of my iMac. I usually do, but I wanted to make doubly sure, as this weekend, I would nuke my disks to make a fusion drive on my iMac from 2011.

When the iMac was released in 2011 with the Z68 chipset, a SSD and a magnetic disc, I was excited, as I was sure Apple would exploit the caching part of the chipset, using 64GB of the SSD for caching. Alas, they didn&#8217;t. So I had to move files to &#8220;strategic places&#8221; and try to get my computer to act as quick as it could, trying to have it rely more on the SSD than the spinning disc.

The announcement of the fusion drive made me very happy, as it seemed that Apple would 1-up the Z68. The fusion drive would keep what was used a lot on my SSD, and use both drives as one combined drive, so no more moving files around manually and symlinking in between. Yay! But, alas, this would only be for the iMac 2012 and the Mac Mini 2012. Luckily, within long, Patrick Stein had shown us all how to use Core Storage to [make our own fusion drive][1]. 

Creating the fusion drive was easy: boot from a USB stick with Mountain Lion 10.8.2, switch to Terminal and do

<pre>diskutil cs create Fusion disk0 disk1
diskutil cs list
diskutil cs createVolume &lt;UUID&gt; jhfs+ Drive 2288g
</pre>

The hard part was finding out what would be the best amount of disk space to set up for the drive, but luckily it was equally easy to delete the fusion drive, so after a few iterations I had made my setup as close to 100% as I thought was good. (26.5MB left)

After completing that, I wanted to restore from Time Machine, but alas, that did not work. So I did a fresh install of Mac OS X instead, and then restored from Time Machine. Much better, that worked without a hitch. The only thing to think about there was that while I had backed up two drives, I now only had one drive, so it restored one drive, and I had to move over the data from the second one. No problem, but worth noting.

At this point, I had my iMac from 2011, a 3.4Ghz i7 with 16GB RAM, booting from a fusion drive built of the 256GB SSD and 2TB drives it was shipped with. This is an awesome setup! The sound from my 2TB drive has always been quite noticeable, and it has been quite silent this weekend. I&#8217;ve been running &#8220;iostat -w 1 disk0 disk1&#8243; all the time, and the 2TB drive has roughly 1/80th the amount of disk access that the SSD has!!! That is amazing, and a whole lot better than what I achieved with my manual setup! <img src='http://blog.saers.com/wp-includes/images/smilies/icon_smile.gif' alt=':-)' class='wp-smiley' /> 

Also, I&#8217;ve had two kernel panics during the weekend. I cannot confirm that this is because of the fusion drive, but in the interest of full disclosure, I think I should bring it up. Patrick was very clear to say he would not recommend using this in a production system. I use it now on my home system, and I probably will for a while, but I have great backups, other machines to work on if this one fails, and a habit of living on the cutting edge. <img src='http://blog.saers.com/wp-includes/images/smilies/icon_wink.gif' alt=';-)' class='wp-smiley' /> 

My conclusion is that you [should][1] [read][2] [Patrick&#8217;s][3] [writings][4] and make up your mind if this is something you want to do. For my part, I have an iMac now that works exactly the way I want it to work, especially if I don&#8217;t get any more kernel panics. Of course, Apple doesn&#8217;t support this one bit, so if they make an update next month that kills of support for older macs, I&#8217;m out of luck. Don&#8217;t use this if you don&#8217;t have great backups, and don&#8217;t use this if you can&#8217;t afford your computer to be offline while you reinstall it and restore from backup. I have great backups and fall-back, so I&#8217;ll be using this setup, and report back on my dealing with it.

A last resource to mention is [Andres Petalli&#8217;s write-up][5], there are a couple of good comments there as well.

 [1]: http://jollyjinx.tumblr.com/post/34638496292/fusion-drive-on-older-macs-yes-since-apple-has
 [2]: http://jollyjinx.tumblr.com/post/34694173142/more-on-byo-fusion-drive-i-wanted-to-know-how
 [3]: http://jollyjinx.tumblr.com/post/34700977027/fusion-drive-loose-ends-as-hinted-in-my-last
 [4]: http://jollyjinx.tumblr.com/post/35013104235/fusion-drive-last-words-the-10-minutes-ive-seen
 [5]: http://www.petralli.net/2012/10/analyzing-apples-fusion-drive-in-an-attempt-to-retrofit-an-existing-macs-with-an-ssd-and-a-traditional-hard-disk/