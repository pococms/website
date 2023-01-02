# Using PocoCMS themes

The easiest way to style the appearance of your site
is to use themes. PocoCMS has two kinds of themes: global 
and page.

A [theme](glossary.html#theme), sometimes called a 
global theme, provides
default styling for every page
in your site. 

A [page theme](glossary.html#page-theme) applies only to 
that page, so if it's named in the front matter of your page, 
the global theme, if any, is ignored on that page.

## Global theme

A global [theme](glossary.htmle#theme) creates 
default styling for every page
in your site. It's specified using `theme`
in the front matter. It can only be used on your
[home page](glossary.html#home-page). 

To apply a global theme named "pocodocs" to
all pages on your site by default:

```
---
theme: "pocodocs"
---
```


See also [page theme](#page-theme)


## Special rule

A page theme overrides the global theme. 
The global theme is set on the [home page](glossary.html#home-page)

So what happens if you use both `theme` and `pagetheme` on
the same page? In the case of the home page, the rule is clear.

##### Filename: **index.md**

```
---
theme: pocodocs
pagetheme: pocodocs/homepage
---
```

Although `theme` sets the default theme, it's overriden
by `theme` in the above special case. This special rule only applies to the home page,
because only the home page lets you set the global theme.

## page theme

A page [theme](glossary.htmle#page-theme) applies 
theme styling on a per-page basis. It overrides any [global theme](#theme)
It's specified using `pagetheme` in the front matter for that page.

To apply a theme named `informer` to the current page:

```
 ---
 pagetheme: "informer"
 ---
```


