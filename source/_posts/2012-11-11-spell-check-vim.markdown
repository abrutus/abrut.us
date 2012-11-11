---
layout: post
title: "Spell Check using VIM"
date: 2012-11-11 00:02
comments: true
categories: ['Coding'] 
---


It should be no secret to anyone that my main editor for programming (and
writing blog posts) is VIM. Given that I have allowed personal posts to
occasionally feature on my blog, I have written some lengthy blog posts. Long posts usually
mean lots of spelling mistakes, and there are some commands that have helped me on the way.

To enable spell check (will highlight misspelled words)
```
:set spell
```
Here's a sample output:

![Sample of VIM's spellcheck'](http://cl.ly/image/3q1u1F0B0Y3T/Screen%20Shot%202012-11-11%20at%2012.19.11%20AM.png)


To advance to the next misspelled word
```
]s
```
or to go to the previous word
```
[s
```

To show spelling suggestions for currently selected misspelled word:
```
z=
```
<img src="http://cl.ly/image/2o1Z2G3O0138/Screen%20Shot%202012-11-11%20at%2012.21.05%20AM.png" alt="Spelling Suggestions in VIM" width="50%" />

And to add a word to VIM's dictionary:
```
zg
```

And of course, to turn off spellcheck:
```
:set nospell
```

Also, if you don't know it by now, this Blog runs on Octopress and is published via git. If you find a post that needs 'refactoring', feel free to [fork](https://github.com/abrutus/abrut.us/tree/master/source/_posts) the repository and do a pull request. Gotta love open source!
