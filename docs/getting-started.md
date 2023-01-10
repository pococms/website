---
aside: docs/gs-aside.md
sidebar: right 
---
# Getting Started

PocoCMS lets you start a website in just a few seconds. 

Before we go there, make sure you can:

* Open a command prompt for your operating system
* Use a text editor
* Understand how to create and navigate directories from the command prompt

Besides those things you won't need any other knowledge. 
These directions guide you through everything you need to know
step by step. OK, time to build a website in exactly one second
more than it takes to read these directions!

## Create a site

* Come up with a name and location for your site. Let's cleverly call it `mysite`
and assume it's in the current directory.


That directory will contain all the files you need to generate your site.
In this documentation it's called your [project](glossary.html#project) or 
[site](glossary.html#site). They're usually synonomous.

* Create the new site with `poco -new`:

You'll type `poco -new` followed by the directory name, like this:

```
poco -new mysite
```

Poco responds instantly that the site has been created:

```
Site published to /Users/tom/pococms/poco/mysite/WWW/index.html
```

* Change to the project directory you just created:

```
cd mysite
```

* We'll look at the files PocoCMS generated in a moment, but let's view the site.

* Run `poco -serve`:

```
poco -serve
```

* This launches a simple webserver that lets you see the site
as others on the web will see it. To view it in a browser,
start the browser and paste in the line with `http://localhost:54321`
as shown below:

```
Web server running at:

http://localhost:54321

To stop the web server, press Ctrl+C
```

You'll see what you've created:

![Default home page created by PocoCMS](img/home-page-default-1366x768.png)

## View the files PocoCMS created

Let's take a look at what `poco -new` just generated. Get a directory
listing. It will appear something like this:

```
WWW
.poco
index.md
```

We'll explain the `WWW` and `.poco` directories in a few moments.

* Take a look at the contents of the `index.md` file:

```
---
title: "Powered with &hearts; by PocoCMS"
---
# Welcome to mysite

hello, world.

Learn more at [PocoCMS tutorials](https://pococms.com/docs/tutorials.html) 
```

Notice there's a directory called `WWW`. Examine its contents. 

##### **Directory:** WWW

```
.
├── WWW
│   └── index.html
├── .poco
└── index.md
```

It generated the file `index.html` from the contents of
`index.md`. Later when you add a theme the output
will also include CSS files and other assets required
when the browser renders your site.

###### [Previous: Getting started](getting-started.html) [Next: Edit the page](gs-edit-page.html)

