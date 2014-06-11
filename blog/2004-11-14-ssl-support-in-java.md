---
title: SSL support in Java
author: niklas
layout: post
permalink: /archives/2004/11/14/ssl-support-in-java/
categories:
  - Work
---
I&#8217;m making an XMLRPC server in Python that I need to access from a Java Servlet. But the default security manager is picky about allowing SSL certificates it does not trust (if you were in doubt: this is a good thing! <img src='http://blog.saers.com/wp-includes/images/smilies/icon_smile.gif' alt=':-)' class='wp-smiley' /> ). The solution (based on [this site][1] was:

<pre>openssl x509 -in server.crt -out server.crt.der -outform der
keytool -keystore $JAVAHOME/jre/lib/security/cacerts -alias pySSL -import -file server.crt.der
</pre>

 [1]: http://archives.postgresql.org/pgsql-jdbc/2003-08/msg00110.php