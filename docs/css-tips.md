# CSS tips

# TODO: Downloadable Fonts, StyleTags 

In case you're new to CSS, here's some handy code
you can drop right into your own themes.

## Contents
[How to do headers using list syntax](#header-list)  
[How to show links with hover indicators](#link-hover)  
[Centering old-school](#centering)  
[Font stacks](#font-stacks)  
[Downloadable fonts](#downloadble-fonts)  

See also
* [Resources](resources.html) page with many classless CSS libraries 


## Centering

Here's how to center a div (or any block-level element) using
old techniques that will work on any mobile browser. 
Replace `header` with whatever element you want centered.

```
header {text-align:center;padding-left:0;padding-right:0;width:100%;margin-left:auto;margin-right:auto;}
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
 
## Downloadable Fonts 

Downloadable fonts

## How to do headers using list syntax
<a name="header-list">

Many PocoCMS header markdown files look like this:

```
* [MySite](/#)
* [Report an issue](https://github.com/pococms/poco/issues)
* [GitHub](https://github.com/pococms/poco)

```

This is list syntax but they don't look bullet lists, they look
like menus. It's a commonly accepted way to create menus using
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

    header>ul>li:first-child>a>del{text-decoration:none;color:red;}

## How to show links with special hover indicators 



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


Here's how to add that effect to a nav bar. If
it were the header, you'd just replace each
`nav` with a `header`.

```
nav,nav>ul>li>a,nav>ul>li>a:link,nav>ul>li>a:visited
  {background-color:blue;color:white;text-decoration:none;}
nav>ul>li>a:hover,nav>ul>li>a:active
  {text-decoration:underline;}
```


