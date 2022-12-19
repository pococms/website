---
pagetheme: "rawdog"
---
#### Theme demos

# Rawdog theme

Rawdog uses the most minimal of style sheets.
It employs plain HTML and just a few tweaks to default
colors, margins, and padding. Here's the whole thing.

## Unsupported features: all of them!

It does NOT support any special PocoCMS theme layout features:

* Header
* Nav
* Aside
* Footer


## Source for the Rawdog theme CSS

The Rawdog theme css in `rawdoc.css` is the simplest of all PocoCMS themes:

      body{margin:5rem}
      article{background-color:white;padding:4rem;border:1px solid gray;box-shadow:3px 3px gray;}
      pre{background-color: ghostwhite;font-size: smaller;overflow: auto;padding: .5em}
      @media (max-width:720px){
        body{margin:1rem;}
        article{padding:1rem;margin:1rem;}
        html{font-size:20px;}
      }


## Supported features

|     |                      |
| --- | -------------------- |
| ❌  | Header on/off        |
| ❌  | Nav on/off           |
| ❌  | Aside left on/off    |
| ❌  | Aside right on/off   |
| ❌  | Footer on/off        |
| ✅  | Responsive           |
| ✅  | Mobile support       |


