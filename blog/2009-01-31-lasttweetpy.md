---
title: lasttweet.py
author: niklas
layout: post
permalink: /archives/2009/01/31/lasttweetpy/
categories:
  - Technology
---
I thought I&#8217;d share this little piece of code. Nothing revolutionary, but all right for Twitter maintenance. I didn&#8217;t want to be following lots of people that don&#8217;t post, so I wrote this little utillity that lists when people posted last time. It requires [python-twitter][1]. To get a nice list of who hasn&#8217;t posted in 2009, do  
`python lasttweet.py | grep -v 2009`  
Likewise, if you want to see everyone that last posted in January and have it sorted by what day in January, do:  
`python lasttweet.py |grep Jan|cut -d ' ' -f 3-9|sort -n`  
Here follows the code:  
`<br />
api = twitter.Api(username='username', password='somepassword')<br />
page = 1<br />
users = api.GetFriends(page=1)<br />
friends = []<br />
friends = friends + users<br />
while(len(users) == 100):<br />
&nbsp;&nbsp;page = page + 1<br />
&nbsp;&nbsp;users = api.GetFriends(page=page)<br />
&nbsp;&nbsp;friends = friends + users</p>
<p>for user in friends:<br />
&nbsp;&nbsp;lastPost = user.GetStatus().AsDict()["created_at"]<br />
&nbsp;&nbsp;print lastPost, user.screen_name<br />
&nbsp;&nbsp;tl = api.GetPublicTimeline(user.name)<br />
`

 [1]: http://code.google.com/p/python-twitter/