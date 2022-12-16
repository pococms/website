---
theme: ".poco/themes/probot"
---
# PocoCMS command-line options

You run `poco` from the command line with this format:

```
poco {optional flags} {optional directory name}

```

If you run Poco by itself, it asssumes the current
directory is a [PocoCMS project](glossary.html#project).
It will assume the current directory contains a
tree of Markdown files and other assets required to build a site,
and it will generate the HTML output in the [webroot](glossary.html#webroot)
directory, called `WWW` by default.

If you are in a Poco directory, the output of `poco` all by itself
looks something like this:

```bash
poco
Site published to /Users/tom/mysite/WWW/index.html
```
You can then load that file right into a web browser for
decent results, or get full coverage by running the built-in server:

```bash
poco -serve
15 Dec 2023 16:17:39 Web server running at http://localhost:54321
To stop the web server, press Ctrl+C
```

Just paste the URL into your browser and you'll see the site as 
others on the Web will see it

### Command-line option help

You can get a summary of command-line options with the `-h` flag
and you'll get something like this (in progress as docs are being
written):

```
poco -h
 -cleanup
    	Delete publish directory before converting files (default true)
  -lang string
    	HTML language designation, such as en or fr (default "en")
  -link-styles
    	Link to stylesheets instead of inlining them
  -new string
    	Create a new site
  -port string
    	Port to use for localhost web server (default ":54321")
  -serve
    	Run as a web server on localhost
  -settings
    	Shows configuration values instead of processing site
  -skip string
    	List of files to skip when generating a site (default "node_modules/ .git/ .DS_Store/ .gitignore")
  -themes
    	Show themes in .poco directory
  -timestamp
    	Insert timestamp at top of home page article
  -verbose
    	Display information about project as it's generated
  -webroot string
    	Subdirectory used for generated HTML files (default "WWW")
```

### Command-line options come immediately after `poco`

lemember that you can builtn in another directory
(see [Building a project in another directory](building-a-project-in-another-directory.html) but just remember it's command-line optins first, directory
name second.

**GOOD: Command-line options first**

```
poco -timestamp ~/mydir/mysite
```

**BAD: Command-line options seccond**

If you don't follow the command-line options first rule, unpredictable
things will happen. Your friends won't like you, your lottery tickets
will lose, and, most important, you'll get unexpected results:j

```
# Bless your heart
poco ~/mydir/mysite -timestamp 
```

### Building a project in another directory

You can also specify that PocoCMS build a project 
in a different directory. Just add its location to the
command line:

```bash
poco ~/html/demosite
Site published to /Users/tom/hmtl/demosite/WWW/index.html

```

{{- /* TODO: screenshots of both kinds of output for timestamp */ -}}

## timestamp

The `-timestamp` command-line option lets you insert
a timestamp before the rest of the article text on your
home page. Useful when server or browser caches are
preventing you from changes to your site's output.

### timestamp example

Enter this at the operating system prompt:

```bash
poco -timestamp
```

Upon completion you'll see the timestamp before the completion message:

```
25 Aug 2023 18:33:29 Site published to WWW/index.html
```

You can now check it against the timestamp on your homepage
to ensure the home page you see has cleared browser or server caches.


## webroot

The `-webroot` command-line option lets you choose what directory
Poco CMS uses for the finished HTML, CSS, images, and related assets
to be published. By default it's `WWW`. 

To change it, just run `poco` `-webroot` followed by the
directory you'd like to use. For example:

```
$ poco -webroot  public_html

```


You'll see results something like this:

```
PocoCMS: Site published to /Users/travis/mysite/public_html
```
