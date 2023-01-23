---
hide: aside
---

# PocoCMS Frequently Asked Questions


What is PocoCMS?
: PocoCMS is the fastest way to turn your words into full-featured
information website with optional header, footer, navbar and sidebar.
It's a static site generator that converts Markdown into HTML using
themes. There's only one file to install. There are no configuration files.
You don't even have to know Markdown to create a full site. It has
full tutorial and reference documentation packed with examples. You
can build an entire website starting with a single Markdown file named `index.md`.

To create a complete website, drop to your operating system's
command prompt and type:

```
poco -new mysite
```

The response: 

```
Site published to /Users/html/mysite/WWW/index.html
```

Edit the file `index.md` it created. Go from this:

```
---
title: "&#129502; Powered by PocoCMS"
---
# Welcome to mysite

hello, world.

Learn more at [PocoCMS tutorials](https://pococms.com/docs/tutorials.html) 
```

To this, by adding the `theme: informer` line as shown:

```
---
theme: informer
---
# Welcome to mysite

hello, world.

Learn more at [PocoCMS tutorials](https://pococms.com/docs/tutorials.html) 
```

Build the site by running poco at the command line:

```
poco
```

The result is a full page with optional header, navbar, sidebar, and footer:

![Default Informer theme screenshot](img/home-page-theme-informer-1366x768.png)

This theme was built using the [PocoCMS theme framework](theme-framework.html) and
it has among its built-in features:

* Change themes on a page-by-page basis
* Mobile-friendly
* Desktop-friendly
* Responsive
* Name one global theme to save typing
* Disable features like header or footer by adding `hide: footer` to the page
* No Javascript required
* Tiny page size 
* Built-in SEO
* Works on older browsers and in low-bandwidth situations

Why does my website look like plain HTML all of a sudden?
: This is probably because an error in your
[front matter](front-matter.html). For example, perhaps
you wanted to hide the [nav](glossary.html#nav) and did
it like this:

```
---
hide nav
---
```

The problem is that `hide` needs a colon after it, like this:

```
---
hide: nav
---
```


What's the difference between a theme and a pagetheme?
: You customize the look of PocoCMS sites with themes. You can do it on each
page in the [front matter](glossary.html#front-matter), like this:

##### Filename: **weather.md**

```
---
pagetheme: informer
---
# Weather

Today's weather outloook is etc.
```

But what if you just want an overall look and don't want to be 
putting `pagethemes` on every page? You go to the [home page](glossary.html#home-page)
and use the `theme` declaration:

##### Filename: **index.md** on the home page

```
---
theme: informer
---
```

Now you can forget about `pagetheme` except when you choose to override the theme for
a particular page.


How do I get blank lines after paragraphs? 
: Method 1: End the line with a single backslash character like this: `\`.
Don't forget the last line doesn't need the backslash.
```
Line 1.\
Line 2.\
Line 3.
```
Method 2: To get end a line and start a new one, you can 
end the first line with two spaces. Imagine the
little dot characters ·· are actually you pressing
the space key twice:

```
Line 1.··   ← Pretend those are 2 space characters
Line 2.
```

**What? Why? This is terrible!**

It's actually the way HTML behaves, and remember that
Markdown was made to be easy to read by itself, but
to [translate directly to HTML](https://daringfireball.net/projects/markdown/) when you did a conversion.

*Some background on HTML and how it works with Markdown*

And in HTML, any number of spaces and/or paragraphs (called `newlines` in the programming world) between words are automatically
replaced by a single space. So, if you write any of these
in Markdown:


```
Line 1.
Line 2.
```

Or this:

```
Line 1.


Line 2.
```

Or even this:

```
Line 1.



Line 2.
```

The result will always be this:

```
Line 1. Line 2.
```

In HTML, if you write this:

```
<p>Line 1.<br/ >Line 1.</p>
``` 

you will get the result you're looking for:

```
Line 1. 
Line 2.
```

There may or may not be a space between paragraphs
depending on how the style sheet was written.

You will get that same result if your code looks like this:

```
<p>Line 1.</p>



<p>Line 1.</p>
``` 

It will still appear this way on the web page:

```
Line 1. 

Line 2.
```

Adding 2 spaces to the end of a line is how to get Markdown
to enclose each line in paragraph tags, but to use a line break between them. Again, if
you type 2 spaces at the end of the first line, 
both will be rendered in HTML as paragraphs. 
This Markdown:

```
Line 1.··   ← Pretend those are 2 space characters
Line 2.
```

Becomes this HTML:

```html
<p>Line 1.<br/ >Line 2.</p>
``` 

And will render something like this:


```
Line 1. 
Line 2.
```
