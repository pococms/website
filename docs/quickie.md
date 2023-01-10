# PocoCMS quickie tutorial for programmers and power users

If you're used to the command line or 
are a veteran static site generator users,
here's a quick visual runthrough of 
the most relevant PocoCMS features.


* Create a site:

```
poco -new mysite
cd mysite

```

* View it in a webserver by running -serve and pasting
`http://localhost:54321` into your browser.

```
poco -serve
```

* Edit the `index.md` file to use a theme:

```
---
theme: informer
title: "Powered with &hearts; by PocoCMS"
---
```

* Refresh. Noice!

* Edit the `index.md` file to hide the navbar:

```
---
hide: nav
---
```

* Refresh to see it's changed.

* Try another theme:

```
---
theme: electro 
---
```

* Drop to the command line and list all themes:

```
poco -themes
```


