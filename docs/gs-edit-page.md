# Editing the page

To make changes to the main part of the web page (the [article](glossary.html#article)), you'll edit the file `index.md`.

* Load `index.md` into your text editor. It looks like this:

```
---
theme: "base"
---
# Welcome to mysite

hello, world.

Learn more at [PocoCMS tutorials](https://pococms.com/docs/tutorials.html) 
```

* Delete the line starting with `Learn more`, and `change hello, world`
to something more helpful. In the example below, replace `https://example.com`
with the name of your own website.

```
# Welcome to mysite

Hello from https://example.com. Our site is changing quickly.

```

* Return to the command line and run poco:

```
poco
```

* And refresh the page:




