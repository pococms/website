# Creating a PocoCMS theme with the framework

The best way to create a highly versatile theme
is to use the PocoCMS [theme framework](theme-framework.html).
It's contained entirely in the Base theme and is the
launchpad for all PocoCMS framework themes, from [Electro](demos/electro.html) to
[Clerk](demos/clerk.html) to [Skyscraper](demos/skyscraper.html).

COVER TODO:
* Downloading fonts
* style tags
* skinny
* Dark themes
* Ideally a nested theme
* Goal is to change things in only 1 place

## Start a new project

Each Poco project is self-contained, with all theme data
contained within the `.poco/themes` subdirectory.
It's easy to copy a theme elsewhere when you're finished
but righ now the safest thing to do is to start
with a test project. We'll call it `t2`.

```
poco -new t2
cd t2
```

## Copy a theme you like

The first thing is to copy a theme you like.

* To copy a theme, choose the theme you want to start with. 
[Base](https://pococms.com/docs/demos/base.html) is the
best place to start.

* Decide on name of your new theme, which of course in this example will
be `tattle` because it's an industry gossip site.

* Copy the theme like this:

```
poco -from base -to tattle 
```
You're then informed:

```
PocoCMS tattle created
```

* Let's test it. Go to your projects' Now to use your theme, 
just specify it in the front matter as you would any other:

```
---
theme: gossip
---
```

* Build the project. It should look like this, 
calling itself the Base theme when we know it's your Gossip theme.

![Screenshot of what looks liek th](img/home-page-default-1366x768.png)

###  Append themename.css to end of the theme's stylesheets rule

* Load the theme's `README.md` file from your project's [root directory](#glossary.html#root-directory) by editing the file `.poco/themes/t2/README.md`. Obviously
you will replace `t2` with whatever theme name you created.
* It will look something like this, in the example where your
theme was copied from the Base theme:

```
---
stylesheets:
- ../../css/root.css
- ../../css/reset.css
- ../../css/sizes.css
- ../../css/layout.css
- ../../css/type.css
- ../../css/mediacolors.css
---
```
* Immediately append the `.css` named after your theme 
to the *end* of the `stylesheets` list:

```
stylesheets:
- ../../css/root.css
- ../../css/reset.css
- ../../css/sizes.css
- ../../css/layout.css
- ../../css/type.css
- ../../css/mediacolors.css
# ADD THE LINE BELOW. Replace t2 with your theme name:
- t2.css

```

The contents of `t2.css` are pretty much blank and
will have no affect on the theme so far:


```
/* OVERRIDE FRAMEWORK SIZES */

/* OVERRIDE FRAMEWORK LAYOUT */

/* OVERRIDE FRAMEWORK TYPOGRAPHY AND FONTS */

/* OVERRIDE MEDIA QUERIES. COLORS FOR LIGHT & DARK THEMES */
@media (prefers-color-scheme:light) {
:root {
  --fg:blue;
}
}

@media (prefers-color-scheme:dark) {
:root {
  --fg:lightgray;
}
}
```


###### [Previous: Add a classless stylesheet to your theme](th-add-classless-css.html)



