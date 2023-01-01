# The PocoCMS theme framework

The PocoCMS theme framework is a set of CSS and text files
designed to make it predictable 
and fast to design attractive themes with these qualities:

* You should be able to choose a theme and start doing serious
work within a few seconds: with just a theme name and 
Markdown files, you should be able to publish your site
moments after starting
* Both mobile and desktop friendly
* Responsive (change behavior to accomodate different screen sizes)
* Accomodate dark themes
* Work on older browsers
* Provide good results in bandwidth-hungry situations by keeping file sizes very small
* Support sidebars (called [asides](glossary.html#aside) in PocoCMS and
HTML) on either side of the page
* Support optional header, navbars, asides, and footers
* Hide header, navbars, asides, or footers on a per-page basis
* Replace header, navbars, asides, or footers on a per-page basis
* Have good [SEO](#glossary.html#seo) right out of the box, making it easier for your sites
* Work entirely without CSS [classes](https://developer.mozilla.org/en-US/docs/Web/CSS/Class_selectors) or [ids](https://developer.mozilla.org/en-US/docs/Web/CSS/ID_selectors).

## PocoCMS theme framework overview

When a [Markdown](glossary.html#markdown) file gets converted to
HTML, PocoCMS inserts stylesheets and, if the theme supports
these features, [page layout elements](glossary.html#layout-elements) 
into the HTML

* header styles, recurring text and images, and formatting
* nav styles, recurring text and images, and formatting
* aside styles, recurring text and images, and formatting
* header styles, recurring text and images, and formatting
* footer styles, recurring text and images, and formatting

Everything listed is optional.

### What poco does when it runs

If you're in a directory created as a Poco [site](glossary.html#site),
you run poco like this:

```
poco
```
It will then find every Markdown file on your site, convert it
to HTML, and deposit the results in the [webroot](glossary.html#webroot)
directory, usually named `WWW`.

So if a file consists of nothing but:

```
hello, world
```
Its most important contents will be generated as:

```
<article id="article-poco">
<p>hello, world.</p>
</article>
```

If you add a theme, you'll get a few more elements on the page.

```
---
theme: base
---
hello, world
```

The `base` theme defines header, footer, nav bar, and so on,
so here's an abbreviated sample of the generated HTML:

##### Filename: **WWW/index.html**

```
<style>
:root {
  --a:blue;                   /* Default link color */
  --fg:black;                 /* Default text color. */
  --bg:white;                 /* Default background color */
  --html-bg:var(--bg);        /* Color enclosing skinny themes */
  .. etc
}
</head>
<body>	
<header id="header-poco"><ul>
<li><strong><a href="#">Base theme header</a></strong>
</li>
.. etc
</ul>
</header>
	
<nav id="nav-poco"><ul>
<li><a href="#">Base theme nav</a></li>
.. etc
<li><a href="#">Technical overview</a></li>
</ul>
</nav>

<article id="article-poco">
<p>hello, world.</p>
</article>
	
<aside id="aside-poco"><h4 id="item-1">Item 1</h4>
<p>Here's a good place to put a
news item of current interest</p>
<h4 id="item-2">Item 2</h4>
<p>Here's a good place to put another
news item of current interest</p>
</aside>

```

These elements are supplied by the theme's [README.md](#theme-readme-md-file) file.
More about that later.

### Refresher: the top part between `---` lines is a YAML document that controls page appearance

So adding the `theme` designation doesn't change what text
appears in between the `<article>/</article>` tags, but it does
affect the styling. The portion between the two `---` lines is
cleverly regarded as a separate document, not part of the Markdown
article at all. It is a separate data description language 
called [YAML](glossary.html#yaml) YAML is a dictionary: it
provides a "key" or lookup term like `theme`, then returns its value, for
example, `informer`.

Most of the YAML you'll see in PocoCMS represents either a single
value or a simple list of values. The key is followed by a colon,
which separates the key from the value. Both are shockingly 
known as key/value pairs.

Here's an example of each kind.

```
---
theme: newfoo
stylesheets:
- new.css
- foo.css
- juststopalready.css
---
```

In the above example, the key `theme` has a single value: the
mythical theme named `newfoo`.

The `stylesheets` key has a list of values, one per line. So
`new.css`,`foo.css`, and `juststopalready.css` all make up 
value assigned to the `stylesheets` list.

## Contents of a theme directory

In this example the user wishes make `base` their global theme.
Where does it come from?

##### Filename: **index.md**

```
---
theme: informer 
---

Check out this newsy site!
```

As PocoCMS is generating HTML it reads the `theme` key
and looks for the Informer theme. It is expected to
be in a subdirectory under `.poco/themes`. A simplified
view of the file structure is shown below:


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
    │   ├── layout.css
    │   ├── media.css
    │   ├── medium-skinny.css
    │   ├── reset.css
    │   ├── root.css
    │   ├── sizes.css
    │   ├── skinny.css
    │   └── type.css
    │
    └── themes
        ├── base
        │   ├── LICENSE
        │   ├── README.md
        │   ├── aside.md
        │   ├── footer.md
        │   ├── header.md
        │   └── nav.md
 
```

As you can see, the theme directory has the following elements:

* A name (derived from the directory name, `base` in this example)
* A `LICENSE` file (all uppercase, no extension). It's required, and serves the same person
as a GitHub [LICENSE files](https://docs.github.com/en/communities/setting-up-your-project-for-healthy-contributions/adding-a-license-to-a-repository).
It indicates the terms under which the theme creator allows it to be distributed.
* A `README.md` file in standard Markdown format. It must present,
although it may be empty.
* Optional and not shown above: other files needed by that particular theme. In
the case above, it's a Markdown file for each page [layout element](glossary.html#layout-element). Stylesheets often show up in the directory too.

## LICENSE file

The required `LICENSE` file may contain any text, but you're
encouraged to use an existing license as described by the
GitHub [LICENSE files](https://docs.github.com/en/communities/setting-up-your-project-for-healthy-contributions/adding-a-license-to-a-repository) page.kj:w

## Theme README.md file

If you want your theme to have a header, navbar, aside, or footer, you
include those keys in the front matter:

```
---
stylesheets:
- ../../css/root.css
- ../../css/reset.css
- ../../css/sizes.css
- ../../css/layout.css
- ../../css/type.css
- ../../css/colors.css
- ../../css/media.css
header: header.md
nav: nav.md
aside: aside.md
footer: footer.md
---
```
The value for the key is the name of a file. It can be any name.
Those are just the conventions used by PocoCMS.

## PocoCMS theme framework stylesheets

You'll see these files in the `.poco/css` directory.
You will normally want to include them in this order
when you [create a theme](themes-creating.html).

* [root.css](#rootcss)
* [reset.css](#resetcss) 
* [sizes.css](#sizescss)
* [layout.css](#layoutcss)
* [type.css](#typecss)
* [colors.css](#colorscss)
* [media.css](#mediacss)

And optionally:

* [skinny.css](#skinnycss)
* [medium-skinny.css](#medium-skinnycss)

### root.css

The PocoCMS theme framework's [root.css](https://github.com/pococms/poco/blob/main/.poco/css/root.css) file defines [CSS variables](https://www.freecodecamp.org/news/what-are-css-variables-and-how-to-use-them/), 
also known as custom properties.
CSS variables make tasks like adjusting light vs. dark theme colors 
or widths easier to maintain and much quicker to adjust.

They let you think in terms of "What do I want the default
text color to be on many page elements?" instead of "What's the
fastest way to search for the color of only the elements I want changed?".

CSS variables allow you to define values this way:

```
:root {
  --a:blue;                   /* Default link color */
  --fg:black;                 /* Default text color. */
  --bg:white;                 /* Default background color */
  --code-fg:var(--fg);        /* Text color for code inside a paragraph */
 }
```

A later CSS file such as [colors.css](#colorscss) uses them like this,
which declares that the navbar, header, and footer should
all share the default text and background colors: 

```
nav,header,footer{color:var(--fg);background-color:var(--bg);}
``` 
`root.css` comes first because it's best to keep CSS variable
declarations at the top.

### reset.css

The PocoCMS theme framework's [reset.css](https://github.com/pococms/poco/blob/main/.poco/css/reset.css) file creates a baseline set of behaviors so that
later stylesheets can rely on a consistent set of defaults across browsers.
It's best to leave this file unedited. The whole theme framework
relies on that state. Nothing wrong with adding your own, additional
resets in a separate file though.

### sizes.css

The PocoCMS theme framework's [sizes.css](https://github.com/pococms/poco/blob/main/.poco/css/sizes.css) file defines values used for width, height,
padding, and margins. Most are arbitrary and just tend to
look good at all screen sizes. But if you wanted, for example, to
adjust line spacings on all paragraphs of text, you could do it here:

##### Filename: **.poco/css/sizes.css**

```
p,ol,ul {line-height:1.75em;padding-top:.25em;padding-bottom:.5em;}
```

What's useful about this file is that it covers many details it's easy
to forget. In the example above it's easy to miss that you probably 
want your paragraphs of text in ordered and unordered lists to employ 
the same spacing. This takes care of it all at once.

### layout.css

The PocoCMS theme framework's [layout.css](https://github.com/pococms/poco/blob/main/.poco/css/layout.css) file handles how page elements are arranged but most crucically
it defines the relationship between article and aside so that both right and
left orientation work. 

### type.css

The PocoCMS theme framework's [type.css](https://github.com/pococms/poco/blob/main/.poco/css/type.css) file sets a few font values for common use.

### colors.css

The PocoCMS theme framework's [color.css](https://github.com/pococms/poco/blob/main/.poco/css/colors.css) file is a central location for site color values. Probably
to be subsumed by [media.css](#mediacss)

### media.css

The PocoCMS theme framework's [media.css](https://github.com/pococms/poco/blob/main/.poco/css/media.css) file defines color sets for both dark and light themes.
It also lets you change behavior of pages based on screen size, or any other
media queries you wish to use.

### skinny.css

The PocoCMS theme framework's [skinny.css](https://github.com/pococms/poco/blob/main/.poco/css/skinny.css) file changes a theme like [Base](https://pococms.com/docs/demos/base.html)
into, which fills the screen, to a theme like [Skyscraper](https://pococms.com/docs/demos/skyscraper.html), which shows the theme in the center of the screen with unused space
to the side. 

See also [medium-skinny.css](#medium-skinnycss)

### medium-skinny.css

The PocoCMS theme framework's [medium-skinny.css](https://github.com/pococms/poco/blob/main/.poco/css/medium-skinny.css) file changes a theme like [Base](https://pococms.com/docs/demos/base.html)
which fills the screen, to a theme like [Pasteboard](https://pococms.com/docs/demos/pasteboard.html), which shows the theme in the center of the screen with some unused space
to the side

See also [medium-skinny.css](#medium-skinnycss)


## Stylesheets in the theme's README.md file

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

### Files used for page layout elements

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

This is also likely for the nav and footer.

### Files can be Markdown or HTML

If a file ends in `.md` it's treated as Markdown. If it ends in
`.html` it's an HTML file and is inserted directly into the
output stream. If it's HTML, you must include the proper
tags for each page layout element: `<header>` and `</header>`,
`<footer>` and `</footer>`, and so on.

### Page layout elements are included on every page, unless you SUPPRESS...

When PocoCMS generates a site, every page uses that theme
incorporates the CSS files required for that theme. The same
is true with the header, nav, footer and aside. Assuming files
for them exist in the `README.md` front matter, each generated
page will have them all. But they can be suppressed on a
page-by-page basis using SUPPRESS. For example, if you don't
wait a page to have a nav bar just do this:

```
nav: SUPPRESS
---
# Missing!

What happened to the navbar on this page?
```

### ...OR replace a page layout element with a local file

You can also replace any single page layout element by
creating a file for it in the same directory as the article. Suppose you
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



