---
layout: post
title: "env: python2: No such file or directory"
date: 2013-09-25 16:29
comments: true
categories:
---
Tried out asciinema and encountered the ```env: python2: No such file or directory``` error. Asciinema must be attempting to use python from the wrong symlink. To create it,
```
sudo ln -s /usr/bin/python /usr/bin/python2
```
(assuming /usr/bin/python is python 2.x). If you dont know where python and it is not located in /usr/bin/python, run ```which python```. To find out which python you have, run ```python --version```. Combining both commands, you could run:
```
sudo ln -s `which python` /usr/bin/python2
```
