---
title: 'Kubrick for WP 1.3 &#8211; RC2'
author: niklas
layout: post
permalink: /archives/2004/10/11/kubrick-for-wp-13-rc2/
categories:
  - Blogs
---
Ryan Boren has released <a href="http://boren.nu/downloads/kubrick-1.3.0-rc2.tar.gz" class="broken_link">Kubrick 1.3-RC2</a>. According to him, the changes since RC1 are:

*   Added 404 page
*   Images are loaded from stylesheet\_dir instead of template\_directory
*   Added links.php and archives.php page templates

After doing a diff between the two, I find that the only file that has been changed is index.php (true, the stylesheet has had a version bump in the comment, but that&#8217;s all). That means, comments, archives, index, footer, page, search, searchform and sidebar are unchanged. Good news if you&#8217;re using Kubrick as a template for building your theme like I am, but bad luck if you were hoping Kubrick is going somewhere. The RC&#8217;s seem to be status quo designwise but implementing WP13 features more and more. Up to you to decide how you like it. I don&#8217;t mind too much, but I&#8217;m always excited to see what new design ideas are thrown around.