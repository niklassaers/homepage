---
title: Main composition
author: Niklas
layout: post
permalink: /archives/2010/10/10/main-composition/
categories:
  - 'Roo &amp; Tiles'
---
While resolving the test problems in the last code, let&#8217;s look at what we get by doing a

> mvn jetty:run

The application has a header on top, a footer in the bottom, and a menu on the left hand side. This is in line with the Composite View pattern described in the [Tiles tutorial][1]:<img class="alignright" title="Composite View" src="http://tiles.apache.org/framework/images/tiled_page.png" alt="Composite View" width="167" height="250" />. To recompose this layout, see src/main/webapp/WEB-INF/layouts/layouts.jspx. In there you find that what we want to work with is <tiles:insertAttribute name=&#8221;body&#8221;/>, but working with this file will let you get the basic layout you want. The different attributes are found in layouts.xml, and they reference their respective files in /WEB-INF/views, so that should get you started making a nice template

 [1]: http://tiles.apache.org/framework/tutorial/pattern.html