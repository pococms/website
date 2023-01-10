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

[-from and -to](#copy-a-theme-with--from-and--to)\
[-port](#port)\
[-preserve](#preserve)\
[-serve](#serve)\
[-skip](#skip)\
[-themes](#themes)
[-timestamp](#timestamp)
[-webroot](#webroot)\


### Command-line option help

You can get a summary of command-line options with the `-h` flag
and you'll get something like this (in progress as docs are being
written):



```
poco -h

Usage of poco:
  -from string
    	Name of theme to copy from
  -lang string
    	HTML language designation, such as en or fr (default "en")
  -new
    	Create a new site
  -port string
    	Port to use for localhost web server (default ":54321")
  -preserve
    	Preserve webroot directory when generating site
  -root string
    	Starting directory of the project (default ".")
  -serve
    	Run as a web server on localhost
  -skip string
    	List of files to skip when generating a site (default "node_modules/ .git/ .DS_Store/ .gitignore")
  -themes
    	Show themes in .poco directory
  -timestamp
    	Insert timestamp at top of home page article
  -to string
    	Name of theme to create
  -verbose
    	Display information about project as it's generated
  -webroot string
    	Subdirectory used for generated HTML files (default "WWW")
```

### Command-line options come immediately after `poco`

Remember that you can build in another directory
(see [Building a project in another directory](building-a-project-in-another-directory.html)) but just remember it's command-line options first, directory
name second.

**GOOD: Command-line options first**

```
poco -timestamp ~/mydir/mysite
```

**BAD: Command-line options second**

If you don't follow the command-line options first rule, unpredictable
things will happen. Your friends won't like you, your lottery tickets
will lose, and, most important, you'll get unexpected results:

```
# Bless your heart
poco ~/mydir/mysite -timestamp 
```

### Building a project in another directory

You can also specify that PocoCMS build a project 
in a different directory. Just add its location to the
command line:

```
poco ~/html/demosite
Site published to /Users/tom/hmtl/demosite/WWW/index.html
```

{{- /* TODO: screenshots of both kinds of output for timestamp */ -}}

## Copy a theme with -from and -to

If you want to create a new theme, the quickest way is
to use the `-from` and `-to` options. You follow `-from` with the
theme you want to copy from, and follow `-to` with the new theme name.

Suppose you want to create a new theme named `future` from
the existing `electro` theme. You'd do so this way:

```
poco -from electro -to future
```

## port

The [-serve](#serve) command-line option lets you 
see the current project as it would appear
on the web, using port `54321`. If you want
to use a different port, this command-line
option does the trick. To use port `42069`:

```
poco -new quickie
cd quickie
Site published to /Users/tom//quickie/WWW/index.html

poco -serve -port 42069
Web server running at:

http://localhost:42069

To stop the web server, press Ctrl+C
```

### Note: you can change the port using the -port option

If you need to use a port other than `54321`, see the
[port](#port) command-line option.




## preserve

When PocoCMS generates a project, it places the output
in the [webroot](#webroot) directory. Before it
does so, it deletes any existing data in that
directory.

If you wish to keep the webroot directory contents between invocations,
just add `-preserve` to the command line:

```
poco -preserve
```

## themes

The `-themes` command-line option shows which themes
are installed in the current project. Go to your
[root directory](glossary.html#root-directory) and
enter:

```
poco -themes
```

The result will be something like:

```
base
clerk
electro
gossip
hero
informer
newman
paper
pasteboard
pocodocs
rawdog
skyscraper
tufte
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


## serve

The `-serve` command-line option runs a simple, local webserver
that lets you see how your site appears live on the web:

```
poco -new quickie
cd quickie
Site published to /Users/tom//quickie/WWW/index.html

poco -serve
Web server running at:

http://localhost:54321

To stop the web server, press Ctrl+C
```

When the server is running, just paste the address 
`http://localhost:54321` into your browser to see the
site live.

### Note: you can change the port using the -port option

If you need to use a port other than `54321`, see the
[port](#port) command-line option.


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


### Note: PocoCMS deletes the webroot contents unless you use -preserve

The contents of the webroot get deleted before the project is generated.
You can prevent that using the [-preserve](#preserve) command-line option.


