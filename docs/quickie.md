# Quickie tutorial for programmers

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
nav: SUPPRESS
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


