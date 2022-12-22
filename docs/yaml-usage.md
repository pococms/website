# YAML usage in PocoCMS

The optional [front matter](front-matter.html) used in PocoCMS documents follows
a human-readable configuration language called [YAML](https://yaml.org/). [
The front matter is considered to be a separate document from the article
itself, even though they're in the same file: the front matter
is a YAML document in its own right. The front matter is never displayed.
It determines how the document gets displayed and rendered into HTML. 

This section describes how PocoCMS uses slighly uconventional YAML conventions.

For example, here's the complete text of a page that gets displayed
without a header:

      ---
      header: "SUPPRESS"
      ---
      Look ma, the header disappeared!

The `YAML` portion of the document is a single rule called `header`.
It consists of a key/value pair separated with a colon. 

* The key is the name of the rule and always comes first. In this case it's `header`
* Next comes the semicolon separating key and value: `:`
* After that is the value, which is `"SUPPRESS"` in this example.

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

      ---
      styles:
      - "p {font-family:'Hoefler Text', 'Nimbus Roman No9 L Regular', serif;}"
      ---

This causes the body text to choose fonts from the list given, in
decreasing priority order. Your browser
wil search for the font named Hoefler Text when rendering paragraphs. If
Hoefler Text can't be found, it will attempt to use Nimbus Roman No9 L Regular
(hell of a font name), and if all those fail it will fall back to the 
`serif` font, which is internal to your browser and which is guaranteed 
to be available.

Sharp-eyed YAML users will notice that in both the case of `"SUPPRESS"` above
for the `header` rule, and `styles` for style tags, the quotes surrounding
the value aren't strictly necessary according to YAML rules.

The reason for this is that sometime characters used by CSS seem to cause
problems with the Go template engine or the Go YAML parser, notably the
curly brace characters `{` and `}`. 

Because of that we suggest double-quoting everything so there's less to
remember. It eliminates a whole class of problems that can be otherwise
hard to track down.




