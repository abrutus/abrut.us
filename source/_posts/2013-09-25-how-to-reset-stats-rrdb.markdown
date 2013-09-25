---
layout: post
title: "How to reset stats-rrdb"
date: 2013-09-25 10:38
comments: true
categories: ['Programming']
---
For some odd reason, I was unable to start the stats-rrdb daemon (it said that it started but it would die immediately afterwards).

After tailing the logs, I found this slightly cryptic error message.
```
Server status update thread exception: Unexpected rrdb metric block pos 648 pos_ts: 1379698992 (expected from tuple: 1379697192)
```
I attempted changing some configs to no avail, so the last resource was to reset the metrics. Given that this was on my VM and no important metrics were being recorded for me, I resorted to clearing all the data (**don't do this in your production environment, unless you don't care about losing all your data**).
```
sudo rm -rf /var/stats-rrdb/*
```
After clearing all the data, I was able to restart the stats-rrdb. Best of luck!
