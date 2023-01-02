---
aside: docs/gs-aside.md
---
# Editing parts of a theme

You'll always want to change the contents of a theme's header, nav bar, aside, 
and footer. You edit the theme directly to do this, and themes
are designed to make it simple.


* If you're reading this tutorial in sequence you're already in the
root directory, but if not it's easy to find, so 
make sure you get to the [root directory](glossary.html#root-directory).
 
* Load the theme's `README.md` file from your project's by editing the file `.poco/themes/mytheme/README.md`. Obviously
you will replace `mysite` with whatever theme name you created.

## Replacing the header



## Replacing the nav

Let's replace the nav and give it the ability to search
[Reddit](reddit.com/r/recipes) for recipes.

The theme's `README.md` will have a line something like this:

```
nav: nav.md
```

In `nav.md`, or whatever file was used to create the nav, 
you'll see the file used to generate the contents of the nav.
Themes have different asides but let's say it looks like this:

##### filename: **nav.md**

```
* [Base theme nav](#)
* [Subscribe](#)
* [Technical overview](#)
* [Free trial](#)
```

* Replace it with this:

```
#### Search recipes on Reddit 
<form action="https://www.google.com/search" class="searchform" method="get" name="searchform" target="_blank">
<input name="sitesearch" type="hidden" value="reddit.com/r/recipes">
<input autocomplete="on" name="q" placeholder="hummus" required="required"  type="text">
<button class="button" type="submit">Search</button>
</form>
```

* Build your site and you'll see something like this (depends on the theme you
chose, in this case, Base):

![Screenshot of Base theme with nav replaced by Reddit Search](img/base-theme-reddit-search-nav.png)

###### [Previous: Hiding parts of a PocoCMS theme globally](gs-hide-theme-parts-globally.html) [Next: Tod](#)

