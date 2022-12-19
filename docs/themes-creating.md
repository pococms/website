# Creating PocoCMS themes


## Theme creation checklist
* Run it through `poco-theme-test` *themename*
* Go to the website directory and run `poco-dir-update`
* Create an entry for it in `docs/theme-demos.md`
* Create a file called `docs/demos/themename.md`

* Include the a pagetheme and featureable.css stylesheet in its front matter

      ---
      pagetheme: "themename.md"
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
 

See also:  
* [Themes technical overview](themes-overview.html)
* [Using themes](themes-using.html)

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

