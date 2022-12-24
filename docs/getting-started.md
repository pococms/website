# Getting Started

## Installation

## TODO: INSTALL INSTRUCTIONS. They should make sure it works with `poco -h` or something


PocoCMS lets you start a website in just a few seconds. Here's how.

* Come up with a name and location for your site. Let's cleverly call it `mysite`
and assume it's in the current directory.


If there's already such a directory name, use something else. That directory
will contain all the files you need to generate your site, so in this 
documenetation it's called your [project](glossary#project) or  [site](glossary#site).
They're synonomous.

* Create the new site with poco:

You'll type `poco -new` followed by the directory name, like this:

```
poco -new mysite
```

Poco responds instantly that the site has been created:

```
Site published to /Users/tom/pococms/poco/mysite/WWW/index.html
```

* Change to that directory:

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
start the browse and paste in the line with `http://localhost`
as shown below:

```
23 Dec 2022 19:43:34 Web server running at:

http://localhost:54321

To stop the web server, press Ctrl+C
```


* TODO: Screenshot

