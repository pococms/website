---
hide: aside
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
directory, called `WWW` by default. If the current directory
isn't a PocoCMS project, it will ask if you want to make it one.

If you are in a Poco directory, the output of `poco` all by itself
looks something like this:

```
poco
Site published to /Users/tom/mysite/WWW/index.html
```
You can then load that file right into a web browser for
decent results, or get full coverage by running the built-in server:

```
poco -serve
Web server running at:

http://localhost:54321

To stop the web server, press Ctrl+C
```

Just paste the URL into your browser and you'll see the site as 
others on the Web will see it.

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

Remember that you can build in another directory
(see [Building a project in another directory](building-a-project-in-another-directory.html) but just remember it's command-line options first, directory
name second.

**GOOD: Command-line options first**

```
poco -timestamp ~/mydir/mysite
```

**BAD: Command-line options second**

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

## Copy a theme with -from and -toh

If you want to create a new theme, the quickest way is
to use the `-from` and `-to` options. You follow `-from` with the
theme you want to copy from, and follow `-to` wth the new theme name.

Suppose you want to create a new theme named `future` from
the existing `electro` theme. You'd do so this way:

```
poco -from electro -to future
```


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

## skip

`skip` lists files and directories you don't want to be published.

Remember that if a directory contains the files `index.md`, `installation.md`,
and `avatar.png`, and `401K-info.xls`, here's what will happen when you 
run PocoCMS:

* `index.md` and `installation.md` will be converted to HTML document files
named `index.html` and `installation.html`. The the HTML files will be published
The Markdown files will not.
* By design, all files other than than Markdown files get published. That's
because they're assumed to be required for the site. In this example,
it makes sense that `avatar.png` gets published but you may not want
the personal spreadsheet with your 401K details published.
* Likewise, you probably don't want directories like `node_modules`,
`.DS_Store`, or `.git` published. 

  `.git` is included here for good form but 
PocoCMS treats directories with that name starts with `.` as hidden and
doesn't publish them.
* The answer to these problems is to list what you don't want published in `skip` 
as shown below.

### Example
```
---
skip:
- 401k-info.xls
- node_modules
- .git
- .DS_Store
- .gitignore
---
```

