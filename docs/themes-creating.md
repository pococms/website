# Creating PocoCMS themes

## Setting font globally

```
/* OVERRIDE MEDIA QUERIES. COLORS FOR LIGHT & DARK THEMES */
:root {
  --html-font:monospace;
}

html * {font-family:var(--html-font);}

```

## Downloading fonts

Add to theme `README.md`

```
importrules:
- url('https://fonts.googleapis.com/css?family=Nova+Mono&display=swap');
- url('https://fonts.googleapis.com/css?family=Roboto+Condensed:400,700&display=swap');    
```


## Showing backgroud behind skinny theme

```
@media (prefers-color-scheme:light) {
:root {
  --html-bg:gray
}
}

@media (prefers-color-scheme:dark) {
:root {
  --html-bg:gray
}
}
```



## TODO: themename.css

Add something like this at the end:

```
@media (prefers-color-scheme:light) {
:root {
  --html-bg:black;
}
}

@media (prefers-color-scheme:dark) {
:root {
  --html-bg:SteelBlue;
  --html-bg:red;
}
}
```
## Theme creation checklist
* Run it through `poco-theme-test` *themename*
* Go to the website directory and run `poco-dir-update`
* Create an entry for it in `docs/theme-demos.md`
* Create a file called `docs/demos/themename.md`

* Include the a pagetheme and featureable.css stylesheet in its front matter.

      ---
      pagetheme: "themename"
      stylesheets:
      - "../../css/featuretable.css"
      ---

* Include the compliance table. Here's the ❌ 

      ## Supported features

      |     |                      |
      | --- | -------------------- |
      | ✅  | Header on/off        |
      | ✅  | Nav on/off           |
      | ✅  | Aside left on/off    |
      | ✅  | Aside right on/off   |
      | ✅  | Footer on/off        |
      | ✅  | Responsive           |
      | ✅  | Mobile support       |
      | ✅  | Dark mode support    |
 
## Separation of Concerns

The PocoCMS [theme framework](theme-framework.html) isn't very big,
but it does a huge amount of work. It has to handle many conflicting
interests: responsiveness, optional header/nav/aside/footer,
aside placements, looking good on both short pages and long ones,
mobile support, and more.

Instead of doing something like this:

```
article > 3 {
  font-size: 1.5em;
  line-height: 1.75em;
  font-family: 'Roboto Condensed','sans-serif';
  font-weight: bold;
  color:gray;
}
```

The framework splits up each job:

##### filename: **overrides.css**

```
/* OVERRIDE FRAMEWORK SIZES */

article > 3 {
  font-size: 1.5em;
  line-height: 1.75em;
}

/* OVERRIDE FRAMEWORK LAYOUT */

/* OVERRIDE FRAMEWORK TYPOGRAPHY AND FONTS */

article > 3 {
  font-family: 'Roboto Condensed','sans-serif';
  font-weight: bold;
}

/* OVERRIDE MEDIA QUERIES. COLORS FOR LIGHT & DARK THEMES */

@media (prefers-color-scheme:light) {
:root {
  --article-h2-fg:red;        /* Article h2 text color */
}
  article>h6>a{background-color:var(--bg);border:1px solid black;}
}

@media (prefers-color-scheme:dark) {
:root {
  --article-h2-fg:cyan;       /* Article h2 text color */
}
  article>h6>a{background-color:var(--bg);border:1px solid white;}
}
```


* When you're creating your theme it's a best practice to append 
a file callled `overrides.css` to the end of the list in 
youre theme's 'README.md', like this


```
stylesheets:
- ../../css/reset.css
- ../../css/sizes.css
- ../../css/layout.css
- ../../css/type.css
- ../../css/colors.css
- ../../css/skinny.css  # Optional
- ../../css/media.css
- ../../css/overrides.css
---
```

* It's a best practice to separate the content of `overrides.css`
into overrides that are in the same order as your stylesheet list.
Separate theme with comments:

##### filename: **overrides.css**

```
/* OVERRIDE FRAMEWORK SIZES */

/* OVERRIDE FRAMEWORK LAYOUT */

/* OVERRIDE FRAMEWORK TYPOGRAPHY AND FONTS */

/* OVERRIDE FRAMEWORK COLORS */

/* OVERRIDE FRAMEWORK MEDIA QUERIES */

```

# Dark mode

Put this at the bottom of your `overrides.css` file:

```
/* DARK MODE THEME SUPPORT (KEEP THIS AT END OF FILE) */
@media (prefers-color-scheme: dark) {
  html,header,article{
    background-color:black;color:white
  }
}
```




See also:  
* [Themes technical overview](themes-overview.html)
* [Using themes](themes-using.html)

## Adding skinny support to a PocoCMS framework project

## TODO: Screen shots
What if you want a theme that floats in the middle of a wide screen,
showing its background like the Pasteboard or Rawdog themes?

The default PocoCMS style framework generates sites with themes that stretch
across the entire screen. You can change this behavior by
adding the `skinny.css` after `base.css` in your theme's `README.md`
file, like this:

---
header: "header.md"
nav: "nav.md"
aside: "aside.md"
footer: "footer.md"

stylesheets:
- "../../css/base.css"
- "../../css/skinny.css"
---

The contents are fairly brief:


      html{background-color:gray;margin-left:auto;margin-right:auto;width:80%;}
      body{margin:5% 5% 5% 10%;}
      aside{width:20%;padding-left:1rem;}
      header,nav,article,footer{margin-left:auto;margin-right:auto;}
      footer{margin-right:10%;max-width:80%;}

## Adding framework support to a classless CSS stylesheet

Here's an example of what it took to get full framework 
support for the Hack theme, which is
based on the hack.css stylesheet by [Egoist](https://github.com/egoist).
We extracted these elements from `base.css` and 
put them in a stylesheet named `override.css`:

##### filename: **override.css**

```css
article,nav,header,footer,aside{padding-left:5%;}
article{width:80%}
aside{width:20%}
/* Article on the right, aside on the left  */
article{float:right;clear:right;}
aside{float:left;}
/* Article on the left, aside on the right  */
article{float:left;clear:left;}
aside{float:right;}
footer {width:100%;position:fixed;bottom:0;height:10vh;}
footer>p,footer>p>a,footer>ul>li{display:inline;text-decoration:none;}
```

## Downloadable fonts

Downloadable fonts require an `@import` rule. `@import` rules need 
to come before other css rules (except @charset and @layer; see [MDN's @import](https://developer.mozilla.org/en-US/docs/Web/CSS/@import) documentation).
Here's an example of a rule that gets the [Oswald](https://fonts.google.com/specimen/Oswald?vfquery=oswald) font from Google.

```css
@import url('https://fonts.googleapis.com/css2?family=Oswald:wght@200&display=swap');
```

Then you might want to redefine `<h1>` to use that font. You'd add
this rule:

```css
article>h1{font-family:'Oswald',sans-serif}
```

Don't add the `@import` rule to your CSS file directly.
Instead, add an `importrules` line to your theme's `README.md` file (see below). This allows PocoCMS to hoist all `@import` rules to the top of the CSS.

Here's an example theme `README.md` showing use of `importrules`:

```css
---
header: header.md
nav: nav.md
aside: aside.md
footer: footer.md

importrules:
- "@import url('https://fonts.googleapis.com/css2?family=Oswald:wght@200&display=swap';"


stylesheets:
- "../../css/base.css"
- "test.css"
---
```

Then in one of the CSS files, for exampple, `test.css`, you'd have a rule like this:

```css

article>h1{font-family:'Oswald',sans-serif}

```

