---
title: The setup of a Spring project
author: Niklas
layout: post
permalink: /archives/2011/04/20/the-setup-of-a-spring-project/
categories:
  - Technology
---
One thing that I seem to forget from project to project (after all, you only need to take care of this once pr project) is that a deployed Spring project is two parts: model, business and controllers is one part, views are another.

This means that in your web.xml you&#8217;re likely to have two parts defined, the org.springframework.web.context.ContextLoaderListener servlet which contains model, business and controllers, and the org.springframework.web.servlet.DispatcherServlet that contains your view resolvers and views.

This distinction is important, if nothing else than because it&#8217;s easy to set the url-pattern for the view servlet too broad, for instance to /*, and this will surely mingle your requests so that you don&#8217;t really know if it goes to the controller or to the view resolver.