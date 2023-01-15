# Creating a theme

When you start a new site you'll probably want to alter customize or a theme. 
Don't make changes to it directly. 
It's best to copy a theme you like and use the copy. 
You'll want to make numerous small changes to it in production.
That way if you  make any big mistakes and want to revert, you'll have 
the original to fall back on.

## Copying a theme

* To copy a theme, choose the theme you want to start with. Let's
say it's [base](https://pococms.com/docs/demos/base.html).
* Decide on name of your new theme, which of course in this example will
be `mytheme` because hey, it's all about you.
* Copy the theme like this:

```
poco -from base -to mytheme
```
You're then informed:

```
PocoCMS mytheme created
```

Now to use your theme, just specify it in the
front matter as you would any other:

```
---
theme: mytheme
---
```

###  Add themename.css to the theme's README.md file

* Load the theme's `README.md` file from your project's [root directory](#glossary.html#root-directory) by editing the file `.poco/themes/mytheme/README.md`. Obviously
you will replace `mysite` with whatever theme name you created.
* It will look something like this, in the example where your
theme was copied from the Base theme:

```
---
header: header.md
nav: nav.md
aside: aside.md
footer: footer.md
stylesheets:
- ../../css/root.css
- ../../css/reset.css
- ../../css/colors.css
- ../../css/sizes.css
- ../../css/layout.css
- ../../css/media.css
---
```
* Immediately append the `.css` named after your theme to the *end* of the `stylesheets`
list:

```
stylesheets:
- ../../css/root.css
- ../../css/reset.css
- ../../css/colors.css
- ../../css/sizes.css
- ../../css/layout.css
- ../../css/media.css
- "mytheme.css" 
```

The contents of `mytheme.css` are pretty much blank and
will have no affect on the theme so far:

```
/* OVERRIDE FRAMEWORK SIZES */

/* OVERRIDE FRAMEWORK LAYOUT */

/* OVERRIDE FRAMEWORK TYPOGRAPHY AND FONTS */

/* OVERRIDE MEDIA QUERIES. COLORS FOR LIGHT & DARK THEMES */
@media (prefers-color-scheme:light) {
:root {
}
}

@media (prefers-color-scheme:dark) {
:root {
}
}
```



