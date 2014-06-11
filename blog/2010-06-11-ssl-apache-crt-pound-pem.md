---
title: 'SSL: Apache CRT => Pound PEM'
author: Niklas
layout: post
permalink: /archives/2010/06/11/ssl-apache-crt-pound-pem/
categories:
  - Technology
---
To convert a certificate generated for Apache to a PEM file usable for Pound, do this:

> openssl x509 -in mycert.crt -out mycert.pem  
> openssl rsa -in mycert.key >> mycert.pem

Now your certificate that was generated for Apache&#8217;s SSL is ready to be used by Pound