---
layout: post
title: "Top 10 Ips in Nginx access log"
date: 2014-02-17 12:57
comments: true
categories: ['Programming']
---
This is an useful query for when you are getting hammered by scripts/bots. I will likely use it again, so here it goes.
```
cut -d ' ' -f1 /var/log/nginx/nginx-access.log | sort | uniq -c | sort -nr | head -10 | nl
```
[source](http://www.commandlinefu.com/commands/view/290/see-the-top-10-ip-addresses-in-a-web-access-log)


