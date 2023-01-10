# PocoCMS SEO

PocoCMS claims that themes created using 
its [theme framework](theme-framework.html) are SEO-enabled. 
Why should you care and what does it even mean?

[SEO](glossary.html#seo) means Search Engine Optimization. 
It's the art of presenting pages on your site in such a way
that they are more likely to bubble to the top of search results.
Why use the term *art* and not *science*? Because there are 
many factors that can't be dealt with by PocoCMS. For example,
if Google decides your site is dangerous, they will downrank 
it or remove it from the public search results.

PocoCMS claims to be SEO-enabled because it closely follows
guidelines such as the invaluable 
[Google SEO starter guide](https://developers.google.com/search/docs/fundamentals/seo-starter-guide)
and [The beginner's guide to SEO](https://moz.com/beginners-guide-to-seo) from [Moz](https://moz.com),
an independent SEO firm with years of experience. The Moz pages 
explaining SEO often appear at the top of the search results.

## Plugins

PocoCMS needs no plugins for SEO support. It is built from the
ground up for SEO.


Here's how PocoCMS builds SEO into its themes.

## Good page structure is easy

The contents of your Markdown article get enclosed in 
`<article>` tags. After that, the best SEO is to


* Use just one [level 1 heading](glossary.html#heading) per page, as recommended by the Google [developer documentation style guide](https://developers.google.com/style/headings)
* Sprinkle in a few level 2 headings
* Use some level 3 headings if necessary

It's dead easy to do and made ultra-simple using Markdown.

## Front matter support for title and description tags

### Add a unique title to your front matter

* According to Google Search Central's [Influencing your title links in search results](https://developers.google.com/search/docs/appearance/title-link)
, each page of your site should has a unique 
[title](front-matter.html#title). It helps Google present
deep search results inside your site. It's this easy:

```
---
title: Helpful and free resources to improve your site's SEO
---
```

### Add a unique description to your front matter

* Search engines like strong, unique `description` metatags, as
described in 
Google Search Central's [Control your snippets in search results](https://developers.google.com/search/docs/appearance/snippet)
article. A well-designed one will show up as the title on a browser tab. It's easy to add 
a title using your front matter:

```
---
title: Helpful and free resources to improve your site's SEO
description: Website SEO tactics | PocoCMS
---
```

## Fast pages improve search results

If you plug any page on the [PocoCMS](https://pococms.com) site into 
the [Pingdom Website Speed Test](https://tools.pingdom.com) or
Google's [PageSpeed Insights](https://pagespeed.web.dev) you'll see
that the pages are very small, usually smaller than the logo on 
a typical web page. For perhaps obvious reasons, small pages
that load fast get favored in search results. People are less 
likely to leave before the page loads.

The average web page size is now something like 1.5 to 3 megabytes, according to
interested parties such as [keycdn](https://www.keycdn.com/support/the-growth-of-web-page-size)
and [Pingdom](https://www.pingdom.com/blog/webpages-are-getting-larger-every-year-and-heres-why-it-matters/).
By contrast, an average page with illustrations on the PocoCMS site (like
https://pococms.com/docs/gs-change-theme.html) is 500KB, with most text-only pages 
weighing in more like 7KB. At the 500KB number you're looking at about 1/3
to 1/6th the average size. Both search engines and users appreciate that.

## Semantic meaning and page structure

Many web developers don't understand that every element of a page has
[semantic meaning](glossary.html#semantic-meaning). Just making
a **bold line** over a paragraph of text does nothing to aid 
search results. But if you decide it's important enough to be
a level 1 heading (as in `# PocoCMS SEO`) and don't use too many
of those on a page, it will add weight to that heading in 
search results.

Likewise whether something is in a [header](glossary.html#header) vs. an 
[article](glossary.html#article) vs. an
[aside](glossary.html#aside) also has semantic meaning, adding
another signal to search queries regarding your topic.

The PocoCMS theme framework has full support for headers, nav bars, footers, articles,
and asides. It's nearly unavoidable: it's hard *not* to do it right when you
have to fill out files named `header.md`, `aside.md` and so on to get
rolling with your site.

## Markdown itself is all about semantic meaning

You almost can't help committing great SEO when you use Markdown. It's just natural
to do this:

```
# Editing the page

To make changes to the main part of the web page (the [article](glossary.html#article)), you'll edit the file `index.md`.

* Load `index.md` into your text editor. It looks like this:

```

than to do this:

##### Ugh. Doesn't even look right

```
**Editing the page**

To make changes to the etc.
```




## Concerns

### Article tags only. No section tags.

Any Markdown file you write to be published gets converted into a single
HTML file enclosing the text of that file inside `<article>` and `</article>`
tags. This is normally good for SEO because it helps you focus on a single
topic per page. That helps users and improves your search signals.

The downside to this is that there's no support for `<section>` through
Markdown files. We have not been able to determine any disadvantages
of this approach, especially not in terms of SEO.

### Occasional minor breaches of semantic meaning

Every once in a while, PocoCMS chooses to break the rules of semantic HTML in minor
ways. These transgressions haven't caused any SEO problems. Examples:

* [2 colors in your logo text](css-tips.html#2-colors-in-your-logo-text) describes how
in the PocoCMS [logo](https://pococms.com) itself abuses the Markdown 
strikethrough characters to change the color of the `CMS` part
of `PocoCMS` in the home page logo. This hasn't seemed to cause
any SEO problems at all, and we have used it in many other sites. 

One reason could be that there is no semantic content in PocoCMS
[theme framework](theme-framework.html) headers. We don't use
`h1` tags (or any other heading level) in headers. Those are
reserved for content inside `<article>` tags as explained elsehere.

### Image sizes aren't specified by default

Many, many themes for other website builders impose oddly specific 
constraints on image size for certain parts of a page,
for example 1048x250 pixels or some damn thing. This is a good thing for
the browser, because it means the browser can figure out exactly how tall
your image is. When it's rendering the page, the text won't reflow.


The PocoCMS theme framework works on any pure Markdown file instantly.
It is also fully responsive. You should be able to drop images in
as you please without specifying a size. For those reasons `<img>` tags are
all given as 100%, meaning that by default they fit the width of their
containing element, so the height has to be computed on the fly. That
can cause the text reflow, and therefore the page resizes itself while you watch. Not the greatest
user experience, but PocoCMS can make no assumptions about your
image content. You can easily add any image requirements to your theme's CSS.

If you can add image constraint sizes to your theme, you'll also improve
SEO performance.

