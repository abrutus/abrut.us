---
layout: post
title: "Creating a virtualenv for use with Django 1.4 and (possibly) Heroku"
date: 2012-10-28 05:25
comments: true
categories: ["Programming", "Programming Every Day"]
---
Say you want to start a project and you want to use Heroku for your quick 'proof of concept'.
You will need virtual environment. 

On my Mac 10.8.2, I did:

```
sudo easy_install virtualenv
sudo easy_install pip
```
Then to create the virtual environment called venv (while on my project folder):
```
virtualenv --distribute venv
```
Then to activate the virutal environment:
```
source venv/bin/activate
``` 
By now, my propmt's prefix would be appended with (venv) and I am inside my virtual environment. I can now proceed to install Django, by executing 
```
pip install Django
```
After installing Django, I can freeze the requirements so Heroku would know which packages to install whenever I do a push by executing 

```
pip freeze > requirements.txt
``` 
and adding the output file(requirements.txt) to the repository.

By using a virtualenv, you can have different projects use different python installations(2.x and 3.x) in a single development machine, and also replicate your exact production environment. Heroku uses the requirements file to install the specific versions of the modules which in turn makes everything a replica of your development environment. 
