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
to something more helpful:

```
---
theme: "base"
---
# Welcome to mysite

Thanks for visiting! We'll change that header in just a moment.

```

* Return to the command line and run poco:

```
poco
```

* And refresh the page:




