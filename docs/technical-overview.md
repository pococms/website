---
Keywords: "PocoCMS, PocoCMS summary, technical overview, how does PocoCMS work"
---

# PocoCMS Technical Overview

PocoCMS is a single executable file that reads a
directory tree of files, converts [Markdown](glossary.html#markdown) files
to HTML, and passes the rest through to
the webroot directory unchanged. 
The [webroot](glossary.html#webroot) is where
HTML, stylesheets, and other file assets
are sent to be published on the Web.

You can theme your website on a global or per-page
basis. Themes are simple directories with
CSS declarations and templates for page
layout features: header, nav, aside, and footer.

Stylesheets are *inlined*, which means that they get absorbed right into the 
generated HTML file. 
It makes web pages render faster, sometimes much faster. 

PocoCMS is meant above all to be unobtrusive,
easy to learn, and extremely easy to get
started with. You don't
have to create weird special files get started,
or download a theme from some obscure
location on the web. Just type some Markdown
and you can get started immediately.

## A PocoCMS site is in a single directory

A PocoCMS site must occupy its own directory. All files
are expected to be in that directory, including theme
files, graphic assets, style sheets, and so on.

The root of the directory requires a file named 
either `index.md` or `README.md`. That file
will be converted to HTML and will be named
`index.html`; such a file is required at the root
of any website. If you have both `README.md`
and `index.md`, in the root directory, 
`README.md` takes priority and `index.md` will be sadly ignored.
You will also get confused when trying to remember 
which file to update, so just don't do that.

You create your site at the command line this way:

```
poco -new mysite
Site published to /Users/tom/pococms/poco/mysite/WWW/index.html
```

The directory in `mysite` looks like this:

```
.
├── index.md
├── WWW
│   └── index.html
└─── .poco
```

The `WWW` directory is called the [webroot](glossary.html#webroot)
and it is where all output goes. To publish your site, you just
need to copy the webroot directory tree onto a public web server.

The `.poco` directory contains all assets needed to build your site:
themes, graphic assets, and so forth. It's shown in most
of its glorious detail [.poco directory structure](poco-directory-structure),
although minor details (such as theme names or particular
CSS files) will be different from that illustration. 

## Markdown extensions

The heart of PocoCMS' code that generates HTML from Markdown is an
incredibly well-written Go Package named [Goldmark](https://github.com/yuin/goldmark),
by a super-intelligent being from the future named [Yuin](https://github.com/yuin) 
who pretends to be human so the rest of us feel better. While poorly
documented on this site, PocoCMS employs many extensions to Markdown
including:

* [goldmark/extension](github.com/yuin/goldmark/extension)
by [Yuin](https://github.com/yuin) adds a cornucopia of
features to CommonMark including 
  - [GitHub-style tables](https://github.github.com/gfm/#tables-extension-)
  - [GitHub-style strikethrough](https://github.github.com/gfm/#strikethrough-extension-) 
  - [GitHub-style autolinks](https://github.github.com/gfm/#autolinks-extension-),
  - [GitHub-style task lists](https://github.github.com/gfm/#task-list-items-extension-)
  - [Definition lists](https://michelf.ca/projects/php-markdown/extra/#def-list)
  - [PHP-style footnotes](https://michelf.ca/projects/php-markdown/extra/#footnotes)
  - [Smartypants typography extensions](https://daringfireball.net/projects/smartypants/)

   The good news is, these features are all extraordinarily useful. The bad news is,
   most of them aren't documented in our [Markdown](markdown.html) guide and they
   could post compatibility problems if you use another static site generator that
   doesn't offer these extensions.
* [goldmark-highlighting](https://github.com/yuin/goldmark-highlighting) 
by [Yuin](https://github.com/yuin) adds syntax highlighting for code blocks
* [goldmark-meta](https://github.com/yuin/goldmark-meta) 
by [Yuin](https://github.com/yuin) parses the YAML front matter
* [goldmark-embed](https://github.com/13rac1/goldmark-embed) 
by [Brad Erickson](https://github.com/13rac1), enables YouTube embeds

## The PocoCMS theme framework

Most PocoCMS themes use the PocoCMS [theme framework](theme-framework.html),
which lets you publish complete-looking sites within a few
seconds of choosing your theme. It's touched on here, but
the [theme framework](theme-framework.html) page goes into
more detail.

Each theme is in its own directory under
`.poco/themes`. So if you want to edit the Electro
theme, you'd go to your site's [root directory](glossary.html#root-directory)
by loading `.poco/themes/electro/README.md`. Because these directories
are completely self-contained they can be copied from other
sources or deleted at will. 

PocoCMS themes are built up stylesheets and from files for the header, nav,
aside, and footer. They're listed in a required file in the theme
`README.md` file.
That `README.md` lists what stylesheets and Markdown files are
required to assemble the finished page.

If a theme specifies, for example, that the
header is generated using `header.md`, then that file gets
rendered in to HTML and placed between `<header>` tags. Same
idea goes for the nav, aside, and footer.

The PocoCMS theme framework expects stylesheets to scope
styles specifically to each layout element,
for example:


##### File: **.poco/css/layout.css**

```
header ol li,header ul li, nav ol li, nav ul li {margin-left:0;}
header>ul>li,nav>ul>li{padding-right:.5em;}
article{width:var(--article-width);height:auto;}  
aside{width:var(--aside-width);padding:0 2em 0 2em;}  
```

This specificity is required because Markdown by definition
produces pure HTML with no classes or Ids allow.

The framework is optimized for quick development, and you
can learn more at [Creating themes](themes-creating.html).


## Global vs. page themes

A `theme` declaration on the home page is also known as the [global theme](glossary.html#global-theme). It lets you propagate the theme through all
pages in the site.

### All pages inherit the home page theme, unless...

If mention a theme
in the [front matter](glossary.html#front-matter) of
the [home page](glossary.html#home-page) and
all other pages in the site will inherit that theme:

##### file: **index.md**

```
---
theme: informer
---
```

### an individual page overrides the theme using pagetheme

But sometimes you want to override the theme for one or more
pages. You can do it on a per-page basis by using the `pagetheme`
declaration:

##### file: **not-the-home-page.md**

```
---
pagetheme: electro
---
```

A theme can also include template files for the
header, nav bar, aside (a.k.a. sidebar), and footer.

### Expensive web designers hate this 1 weird trick

Suppose you want a separate theme for the home page than
for the rest of the site? It's a common case because the
home page is often used for sales purposes.

Remember that you declare a global theme on the
home page using the `theme` declaration, but that
you can override themes on a per-page basis using 
`pagetheme`? Yeah, you see where we're going.

This is how you create a site using the `pocodocs` theme
for everything but the home page, but you use the `hero`
theme for the home page itself. You put *both* declarations
on the home page:

##### file: **index.md**

```
---
theme: pocodocs
pagetheme: hero
---
```


The only place this works is the home page, because it's the only place
PocoCMS respects the `theme:` rule.


## Starting a site

* When you create a new site with `poco -new mysite` (replace
`mysite` with the path to a directory you want to create for your site),
a directory is created with the following contents:

  - A starter `index.md` file with some YAML [front matter](glossary.html#front-matter)
  - An empty directory called `WWW`
  - A populated directory called `.poco`, to be explained in a moment.

```
├── index.md
├── WWW
│   └── index.html
└── .poco

```

This is a simplified view of the directory structure. 
For a more accurate one, see
[Complete tree listing of a new project](#complete-tree-listing-of-a-new-project).


## Building a site

* When you generate a site from within the directory like this, here's 
what happens.

```
cd mysite
poco
```


Invoking `poco` by itself *builds* the site, which means it generates
HTML for your directory tree of Markdown files. In more detail:

* PocoCMS checks to make sure it's in a valid project, which
means it looks for the `index.md` (or `README.md`) home page
in root, a `WWW` directory, and a nonempty `.poco` directory off root.
* Then, for each Markdown file in the directory tree, PocoCMS:
  - Checks for a theme named in its [front matter](gs-change-theme.html#front-matter). Let's imagine the theme is `base`.
  - Looks for that theme in the `.poco/themes` directory. So it would
look in `.poco/themes/base`. Quit with an error if no such directory is found.
  - In the theme's directory, checks for the files required to make
  up a theme. Those files are `README.md` and `LICENSE` (no extension).
  [LICENSE files](https://docs.github.com/en/communities/setting-up-your-project-for-healthy-contributions/adding-a-license-to-a-repository) indicate the
  copyright status of the theme.
  - The `README.md` file contains front matter describing a list of stylesheets
  and Markdown or HTML files required for the page elements
  (header, footer, and so on). For the `base` theme, the list looks like this:

##### Directory: **./poco/themes/base** theme

```
header: header.md
nav: nav.md
aside: aside.md
footer: footer.md
stylesheets:
- ../../css/root.css
- ../../css/reset.css
- ../../css/sizes.css
- ../../css/layout.css
- ../../css/type.css
- ../../css/colors.css
- ../../css/media.css
---
```

## Theme structure

A theme's name is its directory name. The `README.me`
file in that subdirectory has a special use. It
determines what files are used to produce the theme.
It's also known as the [theme README](glossary.html#theme-readme) file.

### Stylesheets in the theme's README.md file

The list of one or more stylesheets in standard Markdown unordered
list format are required for each page that uses the theme.

If a stylesheet is in the theme directory it
will appear like this:

```
stylesheets:
- electro.css
```

### Stylesheets that live on the web 

They can also be specified by URL, as in:

```
stylesheets:
- https://cdn.jsdelivr.net/npm/water.css@2/out/water.css
```

If you don't use a theme or include a `stylesheets` declaration,
no problem. PocoCMS will just crank out raw unstyled HTML.

### Stylesheet paths and the ../ notation

Stylesheet paths begin at the root of the project. 
The `../` notation means to go down a directory. Here's
how to interpret something like this:

```
stylesheets:
- ../../css/root.css
```

If somehow there were stylesheets in the `themes` 
directory, they'd be reached like this:

```
stylesheets:
- ../nope.css
```
Or in the `.poco` directory, also not gonna happen:

```
stylesheets:
- ../../hellno.css
```

Knowing that, here's a directory tree showing where themes 
appear:

```
.
├── index.md
│   
├── WWW
│   └── index.html
│   
└─── .poco
    │
    ├── css
    │   ├── colors.css
    │   ├── .. etc
    │   └── type.css
    │
    └── themes
        ├── base
        │   ├── LICENSE
        │   ├── README.md
        └── .. etc


```

We need access to the `css` directory from a subdirectory
under `themes`, for example, `base` in that illustration.

It's part of the file system so it ends up looking like this:

```
stylesheets:
- ../../css/root.css
```

And that's how all the theme framework themes get to
share CSS files. It allows updates to the framework
by changing only a single file, instead of having
to propagate changes to multiple theme directories.

## Files used for page layout elements

The contents of each of the [page layout elements](glossary.html#layout-element) (`header`, `nav`, `aside`, and `footer`) are derived from the file listed after the element:

```
header: header.md
nav: nav.md
aside: aside.md
footer: footer.md
```

If you don't want a theme to support a particular layout element,
just remove the line. None of the page layout elements
is required.

The filenames can be anything you want, but here at the 
massive corporate Poco HQ we aren't very creative and follow
this convention stricly.

For example,
`header.md` could be as simple as:

##### File: **header.md**

```
Welcome to our incredible site
```

More likely, depending on your site's CSS, it will look something like this: a Markdown unordered list, and will be rendered as horizontal links
on the header:

```
* [pocoCMS](https://pococms.com)
* [Download](https://github.com/pococms/downloads/tree/main/dist)
* [Documentation](/docs/index.html)
* [Report an issue](https://github.com/pococms/poco/issues)
* [GitHub](https://github.com/pococms/poco)
```

This is also likely for the nav and footer. In no case is it required
for technical reasons. It's just how most site menus work these days.

### Files can be Markdown or HTML

If a file ends in `.md` it's treated as Markdown. If it ends in
`.html` it's an HTML file and is inserted directly into the
output stream. If it's HTML, you must include the proper
tags for each page layout element: `<header>` and `</header>`,
`<footer>` and `</footer>`, and so on.

### Page layout elements are included on every page, unless you hide them

When PocoCMS generates a site, every page uses that theme
incorporates the CSS files required for that theme. The same
is true with the header, nav, footer and aside. Assuming files
for them exist in the `README.md` front matter, each generated
page will have them all. But they can be suppressed on a
page-by-page basis using `hide`. For example, if you don't
wait a page to have a nav bar just do this:

```
---
hide: nav
---
# Missing!

What happened to the navbar on this page?
```

### ...OR replace a page layout element with a local file

You can also replace any single page layout element 
[on a per-page basis](gs-parts-of-theme.html#hiding-header-nav-aside-or-footer-on-a-per-page-basis)
by creating a file for it in the same directory. Suppose you
want to remind users to check for an important update. You'd
do this. Your article would include an `nav` declaration like this one
  in the front matter:

##### File: **beta-users.md**

```
nav: news-update.md
# New release!

Beta users should update immediately. See the news announcement above.
```

Then instead of whatever navbar was included in your theme, it's
overridden by the file called `news-update.md` (use any filename you want).

##### File: **news-update.md**

```
If you used beta version 10.0.9, please **[upgrade now](beta-10-0-0.html)**
```

## Installation

PocoCMS is distribued as a single executable file. It doesn't require
an installation step.

When a new PocoCMS project is created via `poco -new`, the factory `.poco`
directory is copied from within the PocoCMS executable.

## Running PocoCMS

Suppose you plan to create a new site, also known as a project.
You'd create a subdirectory, in this example `mysite`, and
make it the current directory:

```
# Create a subdirectory named mysite. 
# Replace with your own directory name here.
mkdir ~/mysite
# Make it the current directory.
cd ~/mysite
```

* Run poco:

```
poco
```

You're then informed:

```
Site published to /Users/tom/pococms/poco/ed/WWW/index.html
```

Here's what happens when you run `poco` with no 
[command-line options](cli.html) as shown previously:

* PocoCMS looks around to see if the directory is empty (as is 
the case in this example, because it was just created).
* If that directory was empty, and if it has
no [home page](glossary.html#home-page), PocoCMS
generates a simple `index.md` file. If you view its contents,
you'll see this:

{{- /* TODO: Confirm and replace with better example */ -}}

```
---
Stylesheets:
- "https://cdn.jsdelivr.net/gh/pococms/poco/pages/assets/css/poquito.css"
---
# Welcome to mysite

hello, world.

Learn more at [PocoCMS tutorials](https://pococms.com/docs/tutorials.html) 

```

{{- /* TODO: Add screenshot */ -}}

When you load the web page you'll see it has minimal styling
and that the first part of the file doesn't get displayed.
That first part between the `---` lines
is called the [front matter](front-matter.html),
and it provides a set of instructions to format and display
the generated HTML, which starts with **Welcome to mysite**.

The front matter is considered a separate document.
It is in [YAML](https://yaml.org) format. The only YAML
in this document is `stylesheets:`, which is used
to generate a `<link>` tag that pulls in a minimal
spreadsheet from a CDN. It could just as easily
be a local file but this makes for a quick demo.

## .poco directory structure 

Here's an accurate but abridged view of the contents of
the `.poco` directory in a new site. Repetitive
elements have been replaced by an `.. etc` note;
if you've seen one theme directory, you've seen them all.

```
.
├── index.md
│   
├── WWW
│   └── index.html
│   
└─── .poco
    ├── css
    │   ├── colors.css
    │   ├── .. etc
    │   └── type.css
    │
    ├── demo
    │   ├── img-sample-night-sky-1280x853.jpg
    │   ├── .. etc
    │   └── mdemo.md
    │
    ├── endjs
    │   ├── empty1.js
    │   └── empty2.js
    │
    ├── img
    │   ├── facebook-14px-clear.svg
    │   ├── facebook-24px-blue.svg
    │   ├── .. etc
    │   ├── twitter-14px-blue.svg
    │   ├── twitter-14px-clear.svg
    │   └── youtube-14px-red.svg
    │
    ├── js
    │   ├── docready.js
    │   ├── last
    │   │   └── aside.js
    │   └── userlast
    │       └── notes.txt
    │
    └── themes
        ├── base
        │   ├── LICENSE
        │   ├── README.md
        │   ├── aside.md
        │   ├── footer.md
        │   ├── header.md
        │   └── nav.md
        │
        ├── electro
        │   ├── LICENSE
        │   ├── README.md
        │   ├── aside.md
        │   ├── electro.css
        │   ├── footer.md
        │   ├── header.md
        │   └── nav.md
        └── .. etc

```
## Complete tree listing of a new project

```
.
├── index.md
├── WWW
│   └── index.html
└── .poco
    ├── css
    │   ├── colors.css
    │   ├── featuretable.css
    │   ├── layout.css
    │   ├── media.css
    │   ├── medium-skinny.css
    │   ├── nav-menu.css
    │   ├── reset.css
    │   ├── root.css
    │   ├── sizes.css
    │   ├── skinny.css
    │   └── type.css
    ├── demo
    │   ├── img-sample-night-sky-1280x853.jpg
    │   ├── index.md
    │   ├── mdemo.md
    │   └── show-layout.md
    ├── endjs
    │   ├── empty1.js
    │   └── empty2.js
    ├── img
    │   ├── facebook-14px-clear.svg
    │   ├── facebook-24px-blue.svg
    │   ├── twitter-14px-blue.svg
    │   ├── twitter-14px-clear.svg
    │   └── youtube-14px-red.svg
    ├── js
    │   ├── docready.js
    │   ├── last
    │   │   └── aside.js
    │   └── userlast
    │       └── notes.txt
    └── themes
        ├── base
        │   ├── LICENSE
        │   ├── README.md
        │   ├── aside.md
        │   ├── footer.md
        │   ├── header.md
        │   └── nav.md
        ├── electro
        │   ├── LICENSE
        │   ├── README.md
        │   ├── aside.md
        │   ├── electro.css
        │   ├── footer.md
        │   ├── header.md
        │   └── nav.md
        ├── hack
        │   ├── LICENSE
        │   ├── README.md
        │   ├── aside.md
        │   ├── footer.md
        │   ├── hack.css
        │   ├── header.md
        │   └── nav.md
        ├── informer
        │   ├── LICENSE
        │   ├── README.md
        │   ├── aside.md
        │   ├── dark.css
        │   ├── footer.md
        │   ├── header.md
        │   ├── index.md
        │   ├── informer.css
        │   ├── nav.md
        │   └── reset.css
        ├── newman
        │   ├── LICENSE
        │   ├── README.md
        │   ├── footer.md
        │   ├── header.md
        │   └── nav.md
        ├── paper
        │   ├── LICENSE
        │   ├── README.md
        │   ├── aside.md
        │   ├── footer.md
        │   ├── header.md
        │   └── nav.md
        ├── pasteboard
        │   ├── LICENSE
        │   ├── README.md
        │   ├── aside.md
        │   ├── foo.css
        │   ├── footer.md
        │   ├── header.md
        │   ├── nav.md
        │   └── pasteboard.css
        ├── pocodocs
        │   ├── LICENSE
        │   ├── README.md
        │   ├── aside.md
        │   ├── big-circles.css
        │   ├── footer.md
        │   ├── header.md
        │   ├── nav.md
        │   └── pocodocs.css
        ├── rawdog
        │   ├── LICENSE
        │   ├── README.md
        │   └── rawdog.css
        ├── skyscraper
        │   ├── LICENSE
        │   ├── README.md
        │   ├── aside.md
        │   ├── footer.md
        │   ├── header.md
        │   ├── nav.md
        │   └── skyscraper.css
        └── tufte
            ├── LICENSE
            ├── README.md
            ├── aside.md
            ├── dark.css
            ├── footer.html
            ├── footer.md
            ├── header.md
            ├── index.md
            ├── layout-only.css
            ├── nav.md
            └── tufte.css
 
```


