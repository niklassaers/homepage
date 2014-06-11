---
title: FreeBSD + postfix + sasl2 + pam + mysql = Working Authenticated SMTP
author: niklas
layout: post
permalink: /archives/2005/04/19/freebsd-postfix-sasl2-pam-mysql-working-authenticated-smtp/
categories:
  - FreeBSD
  - Work
---
This is most of all meant as a note-to-self to next time I&#8217;ll have to do this. 

Installed the port mail/courier-authlib with the following options:  
  
WITH_PAM=true  
  
WITHOUT_VPOPMAIL=true  
  
WITH_MYSQL=true  
  
WITHOUT_POSTGRESQL=true  
  
WITHOUT_LDAP=true  
  
WITHOUT_GDBM=true  
  
WITH_AUTHUSERDB=true 

Installed Postfix with SASL2 and TLS. Config to Postfix&#8217; main.cf:  
  
smtpd\_sasl\_auth_enable = yes  
  
smtpd\_sasl\_local_domain =  
  
broken\_sasl\_auth_clients = yes  
  
smtpd\_sasl\_security_options = noanonymous 

SASL2 needs &#8220;-r -a pam&#8221; flags in /usr/local/etc/rc.d/saslauthd.sh and the following in /usr/local/lib/sasl2/smtpd.conf:  
  
pwcheck_method: saslauthd  
  
mech_list: PLAIN LOGIN 

Finally, /etc/pam.d/smtp:  
  
column=password crypt=0 logtable=log logmsgcolumn=msg logusercolumn=user loghostcolumn=host logpidcolumn=pid logtimecolumn=time sqllog=1 

auth required pam_mysql.so user=postfix passwd=xxxx host=host.domain.tld db=postfix table=mailbox usercolumn=username passwdcolumn=password crypt=0 logtable=log logmsgcolumn=msg logusercolumn=user loghostcolumn=host logpidcolumn=pid logtimecolumn=time sqllog=1 

\# account  
  
account required pam_mysql.so user=postfix passwd=xxxx host=host.domain.tld db=postfix table=mailbox usercolumn=username passwdcolumn=password crypt=0 logtable=log logmsgcolumn=msg logusercolumn=user loghostcolumn=host logpidcolumn=pid logtimecolumn=time sqllog=1 

\# session  
  
session required pam_permit.so 

That should really be all there is to it.