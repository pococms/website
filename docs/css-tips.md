# CSS tips

In case you're new to CSS, here's some handy code
you can drop right into your own themes.

## Contents

* [Social media icons next to heading](#social-media-icons-next-to-heading)
* [Why PocCMS uses rem for sizes](#why-pococms-uses-rem-for-sizes)
* [2 colors in your logo text](#2-colors-in-your-logo-text)   
* [How to do headers using list syntax](#how-to-do-headers-using-list-syntax)  
* [Unordered lists with no bullet characters or indentation](#unordered-lists-with-no-bullet-characters-or-indentation)
* [Links with modern cursor and custom underline](#links-with-modern-cursor-and-custom-underline)  
* [How to show links with separate underline color](#how-to-show-links-with-separate-underline-color)  
* [Centering old-school](#centering)  
* [Font reset](#font-reset)
* [Font stacks](#font-stacks)  
* [Downloadable fonts](#downloadable-fonts)  
* [GitHub-based files get free CDN hosting through jsdelivr.net](#github-based-files-get-free-cdn-hosting-through-jsdelivrnet)  
* [Table tweaks](#table-tweaks)  
* [Documenting special theme features](documenting-special-theme-features)


## Social media icons next to heading

It's nice in an article byline to show social media icons next
to the text. This example displays them to the right of the
text, and they can be clicked through to their respective websites. 


### Use clear:none and float:right

The images won't stay on the same line without
the `clear:none` and `float:right`. It's the key 
to this technique:

```
/* Social media icons hang to right of header text. */
article>h4>a>img{
  clear:none;
  float:right;
  margin-right:1rem;
  margin-top:.2rem; 
  height:1.2rem;
  width:1.2rem;
}
```

Everything but `clear:none` and `float:right` is expected to
be tweaked. It depends on how large the icon images are, where
they're oriented vertically, and how much space you want between them.

### Move them all in from the right margin

Depending on how many icons you have, you may want to pull them
to the left somewhat. Let the `margin-right` value below
vary according to your taste.
 
```
/* Decrease this if there are more icon images next to header.  */
article>h4{margin-right:20%;}
```

### The final markdown

Here's how you'd use the byline in Markdown form:

```
#### By Anna Utopia [![Instagram logo](../.poco/img/instagram-24px-magenta-outline.png)](https://www.instagram.com/anna.u.topia/) [![Twitter logo](../.poco/demo/twitter-24px-blue-outline.png)](https://twitter.com/anna.u.topia/)
```
### SEO considerations for this example

You could use any block-level element. This example
uses `h4` explicitly because headings under `h3` don't get indexed
in search results, yet its semantica importance is probably higher
than whatever `h5` and `h6` would be used for.

## Why PocCMS uses rem for sizes

PocoCMS almost never specifies sizes in `px`. It's always `rem`. 
The reason is that `rem` values are based on the root font size.

That's because it's much friendlier for users who require
accessibility features. You can scale the web page size up or
down and get predictable results.

What's the root font size this is all based on? That's up to the
browser (currently all browsers default to a 16px base font size). 
PocoCMS will sometimes use a construction like this to start 
with a base font size other than the default:

```
html * {font-size:x-large;}
```
Font sizes such as `x-large` are explained in  MDN's
[font-size](https://developer.mozilla.org/en-US/docs/Web/CSS/font-size)
article.

### You're safe to use px sizing

Feel free to specify exact pixel sizes in your own themes. It's
a good practice for web page design for images especially. PocoCMS
doesn't know in advance how you plan to use images, so it uses 
the much more flexible system of proportions. It guarantees
that you can use an image almost anywhere without thinking
too much about how to design things in advance.




## 2 colors in your logo text

In the [PocoCMS](https://pococms.com) header you'll note that `Poco` is one
color and `CMS` is another, even though it's selectable text. We cheated a little
by reassigning the Markdown strikethrough characters. Normally when you start
and end text with two tile characters (`~~`), as in:

#### You type:

```
I ~~really don't~~ love politicians

```

And the result is:

I ~~really don't~~ love politicians  

Since it's highly unlikely you'd want strikethrough characters
in a header, it's safe to style them like this. (The `del`
attribute is strikethrough.)

```
header > ul > li:first-child > a > del, header > p > del {
  color:red;text-decoration:none;font-weight:900;
}
```

Note that this example keeps it specifically to the header.
That reduces the likelihood of problems down the line.

## Unordered lists with no bullet characters or indentation

```
/* --------------------------------------------------
 * Aside unordered lists are used for table of 
 * contents, so disable indentation and bullet 
 * character. Use size, color, and underline
 * to indicate level.
 * --------------------------------------------------
 */   

/* Disable list indentation and bullet characters. */
aside > ul li {list-style-type: none; }
aside > ul li  {margin-left:0em;}

/* Line-spacing for whole unordered list */
aside ul {line-height:1.4rem;}

/* 1st level of list */
aside ul li a {font-size:1.2rem;}
aside ul li a {color:cyan;}
aside ul li a {text-decoration:underline}

/* 2nd level of list */
aside ul ul li a {color:red;border:none;text-decoration:none;}

/* 3rd level of list */
aside ul ul ul li a 
 {font-size:1rem;text-decoration:none;border-bottom:dotted 1px white;}
```

See also

* [Resources](resources.html) page with many classless CSS libraries 

## Unordered lists with no bullet characters or indentation

The Pocodocs theme uses special unordered list
formatting for asides where a table of contents works best. 
Unordered lists are normally indented,
and of course have bullet characters preceding list items.
Since there's limited space in the sidebar, this
technique shows how to indicate level through other
signals. Each of the first 3 levels uses something
other than bullets or indentation to show list level.
The

```
/* --------------------------------------------------
 * Aside unordered lists are used for table of 
 * contents, so disable indentation and bullet 
 * character. Use size, color, and underline
 * to indicate level.
 * --------------------------------------------------
 */   

/* Disable list indentation and bullet characters. */
aside > ul li {list-style-type: none; }
aside > ul li  {margin-left:0em;}

/* Line-spacing for whole unordered list */
aside ul {line-height:1.4rem;}

/* 1st level of list */
aside ul li a {font-size:1.2rem;}
aside ul li a {color:cyan;}
aside ul li a {text-decoration:underline}

/* 2nd level of list */
aside ul ul li a {color:red;border:none;text-decoration:none;}

/* 3rd level of list */
aside ul ul ul li a {
  font-size:1rem;text-decoration:none;border-bottom:dotted 1px white;
}
```

## How to do headers using list syntax

Many PocoCMS header markdown files look like this:

```
* [MySite](/#)
* [Report an issue](https://github.com/pococms/poco/issues)
* [GitHub](https://github.com/pococms/poco)

```

This is list syntax but when rendered as HTML they don't look bullet lists.
Instead, they appear as horizontal menus.
It's a commonly accepted way to create menus using
the following CSS technique, which removes the bullet character
using `list-style-type;none` for `header>ul`, and changes the 
list orientation from vertical to horizontal using 
`display:inline` for `header>ul>li`:

```
header>ul{list-style-type:none;}               
header>ul>li{display:inline;padding-right:.5rem;font-size:1.25rem;} 
header>ul>li>a,
header>ul>li>a:link,
header>ul>li>a:visited
	{text-decoration:none;}
```


### Bonus header concept #1: automatically show the first item in the list larger than the rest

```
header>ul>li:first-child>a{font-size:3rem;font-weight:900;letter-spacing:-.1rem;padding-right:1rem;padding-left:0}
```

### Bonus header concept #2: Redefine the Markdown strikethrough characters to change the color of the selected letters

```
ul>li:first-child>a>del{text-decoration:none;color:red;}
```

[Return](#contents)

## Downloadable fonts

To use downloadable fonts, you need to add an import rule
in the theme's front matter like this:


```
---
importrules:
- "@import url('https://fonts.googleapis.com/css2?family=Oswald:wght@200&display=swap';"
---
```

Then in one of the CSS files, for exampple, `test.css`, you'd have a rule like this:

```
article>h1{font-family:'Oswald',sans-serif}

```

For more details, see [Creating PocoCMS themes](themes-creating.html#downloadable-fonts)

[Return](#contents)


## Centering

Here's how to center a div (or any block-level element) using
old techniques that will work on any mobile browser. 
Replace `header` with whatever element you want centered.

```
header {text-align:center;padding-left:0;padding-right:0;width:100%;margin-left:auto;margin-right:auto;}
```

Why not use more modern techniques? Feel free to! The first wave of
PocoCMS themes is purposesly designed to work with older browsers.

[Return](#contents)

## Font reset

Here's how to change the font of everything all at once. Obviously what comes after
`font-family` is your choice. This example comes from the [Informer](https://github.com/pococms/poco/tree/main/.poco/themes/informer) theme in the [informer.css](https://github.com/pococms/poco/blob/main/.poco/themes/informer/informer.css) file.

```
html * {font-family:Cambria,'Hoefler Text',Utopia,'Liberation Serif','Nimbus Roman No9 L Regular',Times,'Times New Roman',serif;} 
```

<a name="font-stacks"></a>

## Font stacks for sans-serif, serif, and monospace 

HTML defines [font families](https://developer.mozilla.org/en-US/docs/Web/CSS/font-family) such as `sans-serif`, `serif`, and `monospace`.
The standard doesn't go much beyond specifying their rough outlines.

Over the years browser and operating system have accreted their own
[contributions](https://en.wikipedia.org/wiki/Core_fonts_for_the_Web) to help 
make better fonts available to a wide audience.

Since there's no way to know exactly what fonts are on your system, you 
can specify a `font-family` that specifies the order in which you want
these fonts to be used if they're available. The great thing about `font-family`
is that you're always guaranteed some kind of useful minimum.

Font families have page size overhead, unlike [downloadable fonts](#downloadable-fonts).

Here's what we like to use. It's all opinion, and this list is 
subject to change.

### Font stack for sans-serif

Here's the CSS you'd use to specify better defaults for the most
popular font family on the web,`sans-serif`. You can almost
never go wrong with it.

Note that this specifies using this font stack in `article` tags 
but it could just as easily be replaced with 
`h1`, `aside > h2`, etc.

Standard CSS for a sans-serif font stack:

```
article{font-family:"system-ui","-apple-system","LucidaGrandeUI","HelveticaNeueDeskInterface-Regular","HelveticaNeueDeskInterface-Light","DroidSans","Ubuntu Light","Arial","Roboto-Light","Segoe UI Light","Tahoma","sans-serif";}
```

As a [style tag](style-tags.html):
 
      ---
      styles:
        - "article{font-family:'system-ui','-apple-system','LucidaGrandeUI','HelveticaNeueDeskInterface-Regular','HelveticaNeueDeskInterface-Light','DroidSans','Ubuntu Light','Arial','Roboto-Light','Segoe UI Light','Tahoma','sans-serif';}"
      ---

### Font stack for articles using a serif font

If you want your articles to use old-school Times Roman-style newspaper serif fonts, 
but updated for a cleaner look, how about this:

      ---
      article>p,article>ul,article > ol {font-family:Cambria, 'Hoefler Text', Utopia, 'Liberation Serif', 'Nimbus Roman No9 L Regular', Times, 'Times New Roman', serif;}
      ---

As a [style-tag](style-tags.html):

      ---
      styles:
      - "article > p, article > ul, article > ol {font-family:Cambria, 'Hoefler Text', Utopia, 'Liberation Serif', 'Nimbus Roman No9 L Regular', Times, 'Times New Roman', serif;}"
      ---

### Font stack for a more elegant serif

The [Palatino](https://en.wikipedia.org/wiki/Palatino)-style fonts
are elegant and formal-looking. Many systems have something
approximating Palatino.

Note that this specifies using this font stack in `article` tags 
but it could just as easily be replaced with 
`h1`, `aside > h2`, etc.

Standard CSS for Palatino-style font stack:

```
article{'Palatino Linotype','Palatino','Georgia','Times','Times New Roman','New York','serif';}
```

As a [style-tag](style-tags.html):

      ---
      style-tags:
       - "article{'Palatino Linotype','Palatino','Georgia','Times','Times New Roman','New York','serif';}"
      ---
 
### Font stack for `monospace`

The [monospace](https://en.wikipedia.org/wiki/List_of_monospaced_typefaces)-style fonts are unique in that all characters in the font are the same width.
They're good for code listings like the one on this page, for example,
normally found in the HTML `<pre>` and `<code>` elements.

Note that this specifies using this font stack in `article` tags 
but it could just as easily be replaced with 
`h1`, `aside > h2`, etc.

Standard CSS for monospace font stack:

```
article{font-family:Consolas,Monaco,Menlo,'DejaVue Sans Mono','Lucida Console',monospace;}
```

As a [style tag](style-tags.html):

      ---
      styles:
        - "article{font-family:Consolas,Monaco,Menlo,'DejaVue Sans Mono','Lucida Console',monospace;}"
      ---

[Return](#contents)

## Links with modern cursor and custom underline
 
Here's how to create links that show a pointer cursor when 
hovered over, and that show in blue but with lighter blue underline.

```
a{cursor:pointer;color:blue;text-decoration:none;border-bottom:1px dotted LightSkyBlue}
```

[Return](#contents)

## How to show links with special hover indicators 

HTML's default behavior is to show fresh links differently to
ones you've visited before. The fresh ones show up in a bright blue
and the visited ones appear in a sad, scab-like purple brown.
Who wants that.

Modern menus in headers, footers, and nav tend to be shown
the same whether previously visited or not. But often they
show some kind of indicator when the user's mouse is 
hovering over them. 

To get this done you show the normal status with
`text-decoration:none` for the normal `a`, 
`a:link`, and `a:visited` states.

Then for the `a:hover` and `a:active` states, 
set `text-decoration:underline`. You could just
as easily use a different text color, bold the text,
or make its size larger. The great thing about
this effect is that it's transient.


Here's how to add that default behavior to all
your links. 

```
a{color:blue;}
a:link, a:visited {color:inherit;display:inline;} 
a:hover,a:active {text-decoration:underline;} 
```

[Return](#contents)

## How to show links with separate underline color

This is sort of a continuation of [Links with hover indicators](#how-to-show-links-with-special-hover-indicators). It shows you how to underline links
with a different color from
the font, only when they're in play: either being hovered
over or active.

This example shows how to change the underline color

```
a:hover,
a:active {text-decoration:underline;
  text-decoration-color: red;
	-webkit-text-decoration-color: red;}
```

[Return](#contents)

## GitHub-based files get free CDN hosting through jsdelivr.net


The CDN `jsdelivr.net` has a [Migrating from GitHub to jsDelivr](https://www.jsdelivr.com/github) service 
that makes life much easier for people who want their stylesheets hosted on the web. Here's how.

* Visit the [Migrating from GitHub to jsDelivr](https://www.jsdelivr.com/github) page.
* Grab a the URL of a filename from GitHub, for example, this

file created by [Egoist](https://github.com/egoist) and used as the backbone of the PocoCMS Hack theme.

```
https://github.com/egoist/hack/blob/master/src/css/hack.css
```

* Paste that URL into the **GitHub** field.
* It's instantly transformed in the **jsdelivr** field as:


```
https://github.com/egoist/hack/blob/master/src/css/hack.css
```


[Return](#contents)

## Table tweaks

Here are some ways to change table layout and display.
If you were putting the table in the footer, you'd
change `article>` to `footer>`.

```
/* Remove lines in all rows except header */
article>table>tbody>tr>td{text-align:left}

/* Remove lines from all rows of table except header */
article>table>tbody>tr>td{border:none;}

/* Remove lines from table header. */
article>table>thead>tr>th{border:none;} 

/* Force text to stay in one row of the same height */
article>table{white-space:nowrap;}

/* Keep the table narrow. It spaces columns closer. */
article>table{table-layout:fixed;width:35%;}

/* Make rows shorter */
article>table>tbody>tr{line-height:.5rem;}

/* Make columns 12 rem wide */
article th{width:12rem;}

/* First column is just wide enough for checkbox character */
article th:first-child{width:1rem;}
```

[Return](#contents)

## Documenting special theme features

Anytime a theme does something out of the ordinary, 
violates normal design patterns, or surfaces a feature
the user should know, call it this way. If there
are specific steps required to use it, mention
them in the comments:

```
/*
 * --------------------------------------------------
 * Used for those bulleted
 * lists at the beginning of an article, but with
 * SEO powers because it calls them out using h2s
 * that look like an unordered list. Must
 * be preceded by an h4.
 *
 * It works with an h4 (byline) followed by h2s,
 * or an h4 followed by an img followed by an h2
 * --------------------------------------------------
 */
```

Or:

```
/*
 * --------------------------------------------------
 * If you have more than one item, use an unordered list. 
 * These styles show the first item with branding applied,
 * any number of links following, still slightly
 * larger than body text, and a last link that
 * looks like a button.
 * --------------------------------------------------
 */
```
[Return](#contents)


