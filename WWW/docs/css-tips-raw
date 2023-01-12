# CSS tips

## Format for commenting special features that should be added to a theme's public documentation

```
/* --------------------------------------------------
 * SPECIAL FEATURE FOR HEADER: 
 * First item in header gets special treatment:
 * - Larger font size
 * - Deeper text shadow
 * --------------------------------------------------
 */   

header>ul>li:first-child>a,header>p:first-child>a,{
  font-size:3.25rem;
  text-shadow: 3px 3px 0 black;
}

```


## rem vs em

* Use rem for font sizes and @media query, because rem is based 
on browser settings.
* Use em for margins, padding, etc.

# RAW MATERIAL: TABLES



From the Informer theme

```
footer,footer>p,footer>p>a{color:white;background-color:blue;}
footer{color:black;background-color:white;}
footer>table{font-size:.75em;}
/* Make change to all headers (first row of table) */
/* Next 2 lines of code are required. */
table{table-layout:fixed;width:95%;}
footer>table th{font-weight:bold;width:5%;}

footer>table>th,footer>table>td{color:yellow;width:5rem;}
footer>table th{border:0;}  /* Removes border from header row */
footer>table td{border:0;}  /* Remove border from all other rows */
footer>table>thead>tr{line-height:1.5rem;} /* Set height of header row */
footer>table>tbody>tr{line-height:0;} /* Set height of all other rows */

/*This seems unnecessary */
footer>table{
  /* Cells in table share borders */
  border-collapse: collapse;
  border:none;
}
/* Text-align all rows left */
footer>table>tbody>tr>td{text-align:left}
```


In case you're new to CSS, here's some handy code
you can drop right into your own themes.

## Contents

[2 colors in your logo text](#2-colors-in-your-logo-text)   
[How to do headers using list syntax](#how-to-do-headers-using-list-syntax)  
[Unordered lists with no bullet characters or indentation]()

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

[Links with modern cursor and custom underline](#links-with-modern-cursor-and-custom-underline)  
[How to show links with separate underline color](#how-to-show-links-with-separate-underline-color)  
[Centering old-school](#centering)  
[Font reset](#font-reset)
[Font stacks](#font-stacks)  
[Downloadable fonts](#downloadable-fonts)  
[GitHub-based files get free CDN hosting through jsdelivr.net](#github-based-files-get-free-cdn-hosting-through-jsdelivrnet)  

See also

* [Resources](resources.html) page with many classless CSS libraries 

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

```css
ul>li:first-child>a>del{text-decoration:none;color:red;}
```

[Return](#contents)

## Downloadable fonts

To use downloadable fonts, you need to add an import rule
in the theme's front matter like this:


```css
---
importrules:
- "@import url('https://fonts.googleapis.com/css2?family=Oswald:wght@200&display=swap';"
---
```

Then in one of the CSS files, for exampple, `test.css`, you'd have a rule like this:

```css
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
[Return](#contents)

## Font reset

Here's how to change the font of everything all at once. Obviously what comes after
`font-family` is your choice. This example comes from the [Informer](https://github.com/pococms/poco/tree/main/.poco/themes/informer) theme in the [informer.css](https://github.com/pococms/poco/blob/main/.poco/themes/informer/informer.css) file.
```
body,article,header,footer,aside,a,p,h1,h2,h3,h4,h5,h6 {font-family:Cambria,'Hoefler Text',Utopia,'Liberation Serif','Nimbus Roman No9 L Regular',Times,'Times New Roman',serif;}
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
a:link,
a:visited {color:inherit;display:inline;} 
a:hover,
a:active {text-decoration:underline;} 
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


