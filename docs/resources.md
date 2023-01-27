---
hide: aside
title: Helpful and free resources to improve your site's SEO
description: Free ways to make your site SEO faster and better | PocoCMS
---
# Resources: an all-you-can-eat buffet of free and surprisingly useful resources, even for commercial use

This is a curated list of ways to make your web publishing fast and cheaper.
They are all free (some may require attribution or a signup process) and
have withstood the test of time... for a couple of years.

## SEO and Performance

Paste your site URL into these pages and get the unvarnished truth
about what might be interfering with user experience: from speed to
accessibility to SEO.
* Google's perspective on the all-important [title tag](https://developers.google.com/search/docs/appearance/title-link). In PocoCMS you supply it
using `title` in your page's [front matter](front-matter.html#title)
* Google's [PageSpeed Insights](https://pagespeed.web.dev) is 
like a free consultant. The SEO insights are gold.
* When you're testing from the same country in which your site is
hosted, you may not be getting realistic results.
Pingdom's [Website Speed Test](https://tools.pingdom.com) lets you
see how your site performance from different places on the planet. It gives many other 
recommendations to improve your SEO. Essential.
* The [Google SEO starter guide](https://developers.google.com/search/docs/fundamentals/seo-starter-guide) gives
explicit, clear coverage of how to improve your search results.

## HTML

Sometimes it's convenient and maybe even a little fun to use colors by name instead of
obscure RGB values or hex codes. Modern browsers recognize 140 
[HTML Color Names](https://htmlcolorcodes.com/color-names/), even though official 
web standards admit to only [16](https://www.w3.org/wiki/CSS3/Color/Basic_color_keywords)
(boo, hiss).

## CSS

* The least terrible CSS validator is the [Nu HTML Checker](https://validator.w3.org/nu/). Notes:
  + The CSS has to be embedded in an HTML file
  + It doesn't like tabs used as whitespace in the CSS
  + It doesn't recognize the `margin-block-start`, `margin-block-end`, and `padding-inline-start`, which I find
indispensable in my `reset.css` file.
  + There's a very cool version of it that runs locally on your own command line at  https://github.com/validator/validator/releases
  + Remind me and I'll document my script that lets you use this utility to check a standalone CSS file

### Classless CSS

Here are some promising classless CSS libraries you can
use in your own themes.

* Liam Dougherty's [Theme switcher](https://dohliam.github.io/dropin-minimal-css/) highlighing many good classless CSS resources. Dr. Dougherty is [disgustingly accomplished and productive](https://dohliam.github.io/)

## Type

* The [Inter](https://rsms.me/inter/#charset) font is a new [sans-serif](https://developer.mozilla.org/en-US/docs/Web/CSS/font-family#sans-serif) font designed
designed for clarity.

## Icons

* [icongram](https://icongr.am) made it so simple to get icons
using their amazing API. They offer thousands of icons,
but you can get them in any size and color by specifying
what you'd like on the command line. For example, this
yields a YouTube logo in SVG format, size 32x32 pixels,
in red (color #`FF0000`).

```
https://icongr.am/simple/youtube.svg?size=32&color=FF0000
```

* Don't underestimate the 1800+ [Bootstrap icons](https://icons.getbootstrap.com/),


* [Lucide](https://lucide.dev) open source icons

## SVG graphics

* [SVGViewer](https://www.svgviewer.dev) can remove padding from SVGS, validate them, optimize them,
and more.
* [Vecta Nano](https://vecta.io/nano) compresses SVG files with an online interface

## YAML

There are several handy YAML validators online.
These checks YAML files (such as the [front matter](front-matter.html) 
portion of a PocoCMS Markdown file) for proper formatting

* [YAML Lint](https://www.yamllint.com/) 
* [YAML Validator](https://jsonformatter.org/yaml-validator)
* [Code Beautify's YAML Validator](https://codebeautify.org/yaml-validator)
 
## Popular screen sizes for responsive design
* [BrowserStack](https://www.browserstack.com/) has a rare, data-backed writeup at [What is the ideal screen size for responsive design?](https://www.browserstack.com/guide/ideal-screen-sizes-for-responsive-design) to help your figure
out what `@media` queries you might want shoot for. It covers both
mobile and desktop, but combining them, you'll learn that the top sizes
are 1920x1080 (10%), 1366x768 (6%), and 360x640 (6%).

### Top 5 screen resolutions

| Resolution  | % of users |
| ----------- | ---------- |
| 1920x1080   | 9.94%      |
| 1366x768    | 6.22%      |
| 360x640     | 5.88%      |
| 414x896     | 4.21%      |
| 1536x864    | 3.94%      |

## Other graphic assets

* **Free CDN for your assets on GitHub!** [jsdelivr's Migrating from GitHub to jsDelivr](https://www.jsdelivr.com/github) page is an amazing
service that lets you enter the URL of an asset like our sample image of [Anna](https://github.com/pococms/poco/blob/main/.poco/demo/anna-256x256.jpg) and make it available at high speed to anyone on the web at [https://cdn.jsdelivr.net/gh/pococms/poco@main/.poco/demo/anna-256x256.jpg](https://cdn.jsdelivr.net/gh/pococms/poco@main/.poco/demo/anna-256x256.jpg). Thanks, [jsdelivr](https://www.jsdelivr.com)!
* [TinyPNG](https://tinypng.com/) does miracles compressing PNG files. Smaller graphics files means better SEO.
* [CSS Gradient](https://cssgradient.io/) generator goes into more depth than you'd think It has a handy generator on the home page, but then gets into things like [CSS Gradient Text](https://cssgradient.io/blog/css-gradient-text/),  [Gradient Backgrounds](https://cssgradient.io/blog/how-to-create-a-gradient-background/), [Patterns with CSS Gradients](https://cssgradient.io/blog/gradient-patterns/), done-for-you [CSS Gradient Swatches](https://cssgradient.io/swatches/), and  much more.
