---
title: '1236: MySQL replication problem solved'
author: Niklas
layout: post
permalink: /archives/2010/10/15/1236-mysql-replication-problem-solved/
categories:
  - Technology
tags:
  - mysql
  - replication
---
<div id="_mcePaste">
  Ever seen this before? <em>Got fatal error 1236 from master when reading data from binary log: &#8216;Could not find first log file name in binary log index file&#8217;</em> I had that after a MySQL server in my replication loop went down. When it came up, the next server in line gave this replication state <em>&#8216;Relay log read failure: Could not parse relay log event entry. The possible reasons are: the master&#8217;s binary log is corrupted (you can check this by running &#8216;mysqlbinlog&#8217; on the binary log), the slave&#8217;s relay log is corrupted (you can check this by running &#8216;mysqlbinlog&#8217; on the relay log), a network problem, or a bug in the master&#8217;s or slave&#8217;s MySQL code. If you want to check the master&#8217;s binary log or slave&#8217;s relay log, you will be able to know their names by issuing &#8216;SHOW SLAVE STATUS&#8217; on this slave&#8217;</em>, which was quite logical since the end of the bin-log had been corrupted due to external circumstances.
</div>

<div>
  This should be a simple
</div>

> <div id="_mcePaste">
>   STOP SLAVE;
> </div>
> 
> <div id="_mcePaste">
>   CHANGE MASTER TO
> </div>
> 
> <div id="_mcePaste">
>   MASTER_LOG_FILE=&#8217;bin.000nnn&#8217;,
> </div>
> 
> <div id="_mcePaste">
>   MASTER_LOG_POS=1;
> </div>
> 
> <div id="_mcePaste">
>   START SLAVE;
> </div>

<div id="_mcePaste">
  on the node that had stopped replicating, but this is when the 1236 error kicked in. As very often with 1236, the node that had gone down hadn&#8217;t updated it&#8217;s binary log index file (servername-bin.index in this case, yours might have a different prefix) so I had to manually add that in the index file. One more thing to remember, restart the MySQL server after updating the index file. Then replication should happily resume again once you hit </i>START SLAVE;</i> on the next mysql server in the replication ring.
</div>

<div>
</div>

<div>
  PS, take care, the CHANGE MASTER seems to flush the tables or something, it doesn&#8217;t simply set some variables, so depending on the load on your server this might take several minutes
</div>