---
layout: post
title: "301 Redirects with Octopress on Heroku"
date: 2012-11-20 00:40
comments: true
categories: ['Programming'] 
---
I decided to move over my personal blog entries outside this blog. Following good migration procedure, I set up [301 Redirects](http://support.google.com/webmasters/bin/answer.py?hl=en&answer=93633). At first, my dumb self cranked up vim and created a .htaccess, then I remembered that this blog runs on Heroku, which is probably not using Apache (for obvious scalability reasons). After a quick ```heroku ps```, I can see that the 'thin' application is serving my blog. ```thin --version``` reveals that I am running [thin 1.2.6 codename Crazy Delicious](http://code.macournoyer.com/thin/). 

Needless to say, htaccess wont work, so I must resort to using [rack-rewrite](https://github.com/jtrupiano/rack-rewrite)[^1].

I add the gem at the end of my Gemfile:
{% codeblock lang:ruby %}
gem 'rack-rewrite'
{% endcodeblock %}


Then I add my rewrite rules to config.ru (after the $root line)
{% codeblock lang:ruby %}
use Rack::Rewrite do
	r301 %r{^/blog/2012/10/25/bliss-that-is-out-of-reach/?$}, 'http://blog.andrebrutus.com/2012/10/25/bliss-that-is-out-of-reach/'
	r301 %r{^/blog/2012/10/28/job-sins-from-the-youth/?$}, 'http://blog.andrebrutus.com/2012/10/28/job-sins-from-the-youth/'
	r301 %r{^/blog/2012/11/03/chronicles-of-a-bittersweet-travel-experience/?$}, 'http://blog.andrebrutus.com/2012/11/03/chronicles-of-a-bittersweet-travel-experience/'
	r301 %r{^/blog/2012/10/24/quote-from-job-2/?$}, 'http://blog.andrebrutus.com/2012/10/04/quote-from-job-2/'
end
{% endcodeblock %}

Then download the rake-rewrite gem by executing ```bundle```. 

Finally, update your blog by ```rake generate``` and publish away! You can see the changes to both the Gemfile and confi.ru on my <a href="https://github.com/abrutus/abrut.us/commit/570fbe904a673d5fee0e5ab41ec3208f1c7a46f7#diff-0" target="_blank">github commit</a>

Footnotes:

[^1] While definitely more verbose, <a href="http://adamwiggall.com/blog/2012/01/05/redirects-octopress-and-heroku" target="_blank">this article</a> helped me find the solution.
