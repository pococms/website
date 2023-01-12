# Creating a theme

When you start a new site you'll probably want to alter customize a theme. The best
practice is to make a copy of that theme first.

## Copying a theme

It's best to copy a theme you like instead working with it directly,
because you'll want to make numerous small changes to it in production.
That way if you  make any big mistakes and want to revert, you'll have 
the factory original to fall back on.

* To copy a theme, choose the theme you want to start with. Let's
say it's [Pasteboard](https://pococms.com/docs/demos/pasteboard.html).
* Decide on name of your new theme, which of course in this example will
be `mytheme` because hey, it's all about you.
* Copy the theme like this:

```
poco -from pasteboard -to mytheme
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
theme was copied from the Pasteboard theme:

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
- "https://unpkg.com/mvp.css@1.12/mvp.css"
- ../../css/sizes.css
- ../../css/layout.css
- "../../css/medium-skinny.css"
- "pasteboard.css"
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
- "https://unpkg.com/mvp.css@1.12/mvp.css"
- ../../css/sizes.css
- ../../css/layout.css
- "../../css/medium-skinny.css"
- "pasteboard.css"
- ../../css/media.css
- "mytheme.css" 
```

The contents of `mytheme.css` are pretty much blank and
will have no affect on the theme so far:



