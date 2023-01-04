---
aside: SUPPRESS
styles:
- "article>h3{font-weight:normal;}"
---
# Front Matter

{{- /* # TODO:
[branding](#branding)
[scriptafter](#scriptafter)  
*/
-}} 

*Front matter* optionally starts your file. It contains
instructions for things Markdown can't do for you,
for example, choosing a theme, inserting Javascript
or new style tags into your document, and ensuring
each page can have a unique `<title>` tag.

Here's an example of a page with a [title](#title) defined in the front matter.

```
---
title: Who doesn't love static site generators?
---
# My life is now perfect

Thanks to exercise, diet, and mostly, PocoCMS.
```
This page gives you a somewhat technical overview
of front matter, then explains all the 
front matter options PocoCMS provides.

[Formatting rules](#formatting-rules)  
[Front matter basics](#front-matter-basics)   


## Alphabetical list of front matter options


[aside](#aside)   
[author](#author)  
[description](#description)  
[footer](#footer)  
[header](#header)  
[keywords](#keywords)   
[key/value pairs](#keyvalue-pairs)  
[lang](#lang)  
[nav](#nav)  
[pagetheme](#pagetheme)  
[robots](#robots) 
[script-after](#script-after)  
[skip](#skip)  
[styles](#styletags)  
[stylesheets](#stylesheets)  
[theme](#theme)  
[title](#title)  

Return to [top](#front-matter)

## Front Matter basics

The simplest PocoCMS Markdown document looks something
like this:

    hello, world.

It generates the following HTML document:

```html
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Powered by PocoCMS</title>
</header>
	<article id="article-poco">
  <p>hello, world.</p>
	</article>
</div><!-- content-wrap -->
	</div><!-- page-container -->
</body>
</html>
```

You will normally see a more complex structure, with
nonprinting commands that start the file:

```
---
title: "Introducing PocoCMS"
keywords: "static site generator, jamstack, cms"
---
hello, world. 
```

The text between the two `---` lines is considered a separate
document with no direct relation to the remainder of the
file, which is the Markdown portion. It's called *front matter*
by convention, but what lies between the bracketing `---` 
characters is essentially a database in [YAML](https://yaml.org/)
format.  This data is used to control the format and
output of the HTML files PocoCMS produces.

Here's what happens when PocoCMS generates HTML for the
previous example:

```html
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Introducing PocoCMS</title>
  <meta name="keywords" content="static site generator, jamstack, cms">
</header>
	<article id="article-poco">
  <p>hello, world.</p>
	</article>
</div><!-- content-wrap -->
	</div><!-- page-container -->
</body>
</html>

```

In the first example PocoCMS inserted this shamelessly 
self-promoting `<title>` tag:

```html
<title>Powered by PocoCMS</title>
```

That's because an HTML file is not considered valid without a title. 
As you've already surmised, this portion of the front matter

```
---
title: "Introducing PocoCMS"
---
```

Is responsible for this line of HTML:

```
<title>Introducing PocoCMS</title>
```

And obviously this line of front matter

```
---
keywords: static site generator, jamstack, cms
---
```

Caused a `keywords` metatag to be inserted into the file:

```html
<meta name="keywords" content="static site generator, jamstack, cms">
```

Return to [top](#front-matter)

## Formatting rules

* The front matter always starts with a dashed line consisting
solely of 3 hyphens: `---`
* The first line of front matter must be the very first line
of the Markdown file. Blank lines before the
front matter aren't allowed. (If there's no front
matter, blank lines are permitted)
* The front matter always ends with a line consisting
solely of 3 dashes: `---`
* The dashed lines demarcate YAML front matter but do not include it.
That is, the YAML begins after the first dashed line and 
end before the second dashed line.
* Front matter consists of key/value pairs, where
the key precedes a colon and the value comes after the colon.
* The key name (on the left side, behind the colon) is
case sensitive. So while this will create a `<title>`
tag in your HTML document:

```
---
title: PocoCMS makes cry out with joy
---
```

This will not:

```
---
Title: I'm totally invisible
---
```

* YAML documents usually can't be empty. Don't start a file
with empty front matter like this:

```
---
---
```

## aside

Controls behavior of the sidebar, shown in [Anatomy](gs-parts-of-theme.html#anatomy).

1. When given the value "right" or "left", determines whether an [aside](glossary.html#aside) appears to the
left or right of the article. Some themes may not support it
but all [theme framework-based themes](theme-framework.html) 
allow it by defaut. For example:

```
---
aside: left
---
```
2. When given the value as SUPPRESS, hides the sidebar for this page only.
```
---
aside: SUPPRESS
---
```
3. When given a filename, uses the contents of that file instead of the
value supplied by the theme. 
```
---
aside: new-aside.md
---
```

##### Filename: **new-aside.md**

```
Announcement soon. Check the [news](news.html) page tomorrow!
```
See also [header](#header), [nav](#nav), and [footer](#footer) 

## author 

Causes an `author` metatag to be inserted into the file.

### Example

Using this `Author` declaration in the front matter:

```
---
author: "Tom Campbell"
---
```

Causes this metatag to be generated:

```html
<meta name="author" content="Tom Campbell">
```

## description

Causes a `description` metatag to be inserted into the file.

### Example

Using this `Description` in the front matter:
```
---
description: "PocoCMS is the easiest static site generator available"
---
```

Causes this metatag to be generated:

```html
<meta name="description" content="PocoCMS is the easiest static site generator available">
```
## footer 

Controls behavior of the footer, shown in [Anatomy](gs-parts-of-theme.html#anatomy).

1. When given the value as SUPPRESS, hides the footer for this page only.
```
---
footer: SUPPRESS
---
```
2. When given a filename, uses the contents of that file instead of the
value supplied by the theme. 
```
---
footer: new-footer.md
---
```

##### Filename: **new-footer.md**

```
Powered by PocoCMS!
```
See also [header](#header), [nav](#nav), and [aside](#aside) 


## header

Controls behavior of the footer, shown in [Anatomy](gs-parts-of-theme.html#anatomy).

1. When given the value as SUPPRESS, hides the header for this page only.
```
---
header: SUPPRESS
---
```
2. When given a filename, uses the contents of that file instead of the
value supplied by the theme. 
```
---
header: new-header.md
---
```

##### Filename: **new-header.md**

```
**Powered by PocoCMS!**
```
See also [nav](#nav), [aside](#aside), and [footer](#footer) 

## lang

Sets the code HTML uses for its `html lang=` tag.
Defaults to `en` for English.

### Example

* Create a simple file with no Markdown at all, just this
front matter, which changes the language to Icelandic:

```
    ---
    lang: "is"
    ---
```

* Run poco and then view source. You'll see this:


<html lang="en">

## nav 

Controls behavior of the navbar, shown in [Anatomy](gs-parts-of-theme.html#anatomy).

1. When given the value as SUPPRESS, hides the navbar for this page only.
```
---
nav: SUPPRESS
---
```
2. When given a filename, uses the contents of that file instead of the
value supplied by the theme. 
```
---
nav: new-navbar.md
---
```

##### Filename: **new-navbar.md**

```
Announcement soon. Check the [news](news.html) page tomorrow!
```
See also [header](#header), [aside](#aside), and [footer](#footer) 

## pagetheme 

Defines a [page theme](glossary.html#page-theme) to 
replace the global [theme](#theme) if any,
on a per-page pgases. 

```
---
pagetheme: hero
---
```

## robots 

Causes a [`robots` metatag](https://moz.com/learn/seo/robots-meta-directives#:~:text=Robots%20meta%20directives%20(sometimes%20called,or%20index%20web%20page%20content.) to be inserted into the file.

### Example

Using this `Robots` entry in the front matter:

```
---
robots: "NoIndex"
---
```

Causes this metatag to be generated:

```html
<meta name="robots" content="noindex">
```

**NOTE**

Be careful following this example! It tells 
search engines *not* to index your page, which is
the opposite of what you normally want.


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
- www
- .git
- .DS_Store
- .gitignore
---

```

Here are some common items to skip:

```
---
skip-publish:
- node_modules
- htdocs
- public_html
- www
- .git
- .DS_Store
- .gitignore
---
```

## theme

Defines a [theme](glossary.html#theme) to be used as 
the default for all pages in the site. It's also
called the *global theme* informally.
It is optional.  The global theme can be overridden 
on a per-page basis using [pagetheme](#pagetheme).

```
---
theme: pocodocs
---
```

## title
The `Title` key lets you set a title for your HTML page.
This has a number of important benefits.

* It will be used for browser tabs open to that page
* It may influece search results
* It assists screen readers for visually impaired users
* It allows you to create a unique title for each page, which
is considered table stakes for government accessibility requirements
in the USA
* It is one of the few tags required to make an HTML-conformant document

Example:

```
---
title: "Static generator overview"
---

Here's your {{ .title }}.
```

This page would have its `keywords` [metatag](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/meta/name) set to 
`Static generator overview` and the page generated would
read as shown beloe in a web browser:


```
Here's your Static generator overview
```

## stylesheets 

Causes a stylesheet link to be inserted into the file
for each file in the list.

### Example

Using these `stylesheets` in the front matter:
```
---
stylesheets: 
- "../../css/layout.css"
- "https://cdn.jsdelivr.net/npm/@ajusa/lit@latest/src/lit.css"
---
```

# styles

Causes a `<style>` tag to be inserted into the file
for each line in the list. Because they
are inserted after [Stylesheets](#stylesheets) they
override whatever appears in the stylesheets for
the current page.
It's a good way to develop stylesheets slowly, or
to override colors for a light them to make it 
dark, and vice versa.

### Example

Using this `styles` entry in the front matter to color all
your article text blue:

```
---
style: 
- "article>p{color:blue;}"
---
```

Will cause the text on this page to be blue.

Causes this HTML to be generated:

```html
<style>article>p{color:blue;}</style>
```


