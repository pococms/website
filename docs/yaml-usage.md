# YAML usage in PocoCMS

The optional [front matter](front-matter.html) used in PocoCMS documents follows
a human-readable configuration language called [YAML](https://yaml.org/). 
The front matter is considered to be a separate document from the article
itself, even though they're in the same file: the front matter
is a YAML document in its own right. The front matter is never displayed.
It determines how the document gets displayed and rendered into HTML. 


Here's an example:

##### Filename: **index.md**

```
---
pagetheme: pocodocs
hide: header
---
hello, world.

```

As you've probably figured out, this will display a page
with the article contents `hello, word.`, surrounded by an informal,
colorful theme without its header.

The separate YAML document is between the `---` lines. 
Those lines are delimiters. They are part of neither document.
They act solely to enclose the YAML.

After the second such  `---` line, the YAML document ends and
your Markdown [article](glossary.html#article) begins.


## Avoid blank YAML sections

The YAML specification warns against constructions
like the example below, where the entire YAML
document is empty but still surrounded
by delimiters:

##### Filename: **badyaml.doc**

```
---
---
↑ Just remove these if they're empty

```

### More on YAML at a high level

The following section describes how PocoCMS uses slighly uconventional YAML conventions.

For example, here's the complete text of a page that gets displayed
without a header:

```
---
hide: header
---
hello, world.

```

The `YAML` portion of the document is a single rule called `hide`.
It consists of a key/value pair separated with a colon. 

* The key is the name of the rule and always comes first. In this case it's `hide`
* Next comes the semicolon separating key and value: `:`
* After that is the value, which is `header` in this example.

## Rules that end in S take lists, not just a single value

If you see a key ending in `s`, it means you can list one or more values.
They should start with a `-` and a space, and should each take exactly one line. 
For example, all theme [README.md](themes-overview#readmemd) 
files contain a list of stylesheets required for the theme:

      stylesheets:
      - "../../css/base.css"
      - "https://unpkg.com/mvp.css@1.12/mvp.css"
      - "pasteboard.css"


## Double quotes everywere!

Here a rule showing why all rule values are double-quoted in PocoCMS.

```
---
styles:
- "p {font-family:'Hoefler Text', 'Nimbus Roman No9 L Regular', serif;}"
---
```

This causes the body text for paragraphs to choose fonts from the list given, in
decreasing priority order. Your browser
wil search for the font named Hoefler Text when rendering paragraphs. If
Hoefler Text can't be found, it will attempt to use Nimbus Roman No9 L Regular
(hell of a font name) If all those fail it will fall back to the 
`serif` font, which is internal to your browser and which is guaranteed 
to be available.

Sharp-eyed YAML users will notice that in both the case of `header` above
for the `hide` rule, and `styles` for style tags, the quotes surrounding
the value aren't strictly necessary according to YAML rules.
For example:

      stylesheets:
      - "https://unpkg.com/mvp.css@1.12/mvp.css"


The reason for this is that sometime characters used by CSS seem to cause
problems with the Go template engine or the Go YAML parser, notably the
curly brace characters `{` and `}`. 

Because of that we suggest double-quoting values (the left side of a rule)
whenever there might be some ambiguity. 
It eliminates a whole class of problems that can be otherwise hard to track down.

## Comments

YAML files let you add notes or temporary strike out lines
using comments. A comment is any line starting with the `#`
character. It causes YAML to ignore the rest of the line.
Here are a few examples of how it might be used.


**Comments in a Markdown page**  

```
---
styles:
# Old version:
# "p {font-family:sans-serif;}"
# New version:
- "p {font-family:'Hoefler Text', 'Nimbus Roman No9 L Regular', serif;}"
---
# Welcome!

hello, world.
```

Although this appears to be a Markdown page, remember that 
the Markdown only starts after the second `---` delimiter.
Everything between those delimiters is YAML, and `#` followed
by a space specifies that YAML ignores anything that space.
That's a comment.

**Comments in a theme READ.me file**  

Here' another example of YAML comments, this time in a
[theme READE.me](glossary.html#theme-readme) page.
Once again, comments appear in the YAML portion,
not the markdown.

```
---
# Need better branding than just "Informer"
branding: Informer 

# Original theme file is header.md
header: newheader.md

# Disable aside in the theme
#aside: aside.md

stylesheets:
# Consider making it a narrow theme
#- ../../css/skinny.css
- "informer.css"
---
```



