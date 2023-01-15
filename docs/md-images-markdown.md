# Images in Markdown

Recall that to create a link in Markdown you do 
something like this: `[PocoCMS home page](https://pococms.com)`.


You can to insert an image into your Markdown with syntax much
like that, but starting with an exclamation point or `!` character.


* To insert the image file named `fishing-3635221.svg` onto your page,
you'd do it like this:

```
![Cartoon of man fishing above enormous fish](fishing-3635221.svg)
```

The result would be:

![Cartoon of man fishing above enormous fish](fishing-3635221.svg)


Note that the text  `Cartoon of man fishing above enormous fish`
doesn't seem to appear. It will if you hover over it. 
These descriptions are necessary for visually impaired users who
may not be able to see what's going on. Screen readers use that
description to narrate for theme.

## Clickable image links

You can add Markdown to make an image that's clickable and
takes you to another web page. The form is:

```
[![alt text](image filename)](URL)
```

So if you have in image named `bird.svg` in the 
current directory, and you want to link to Twitter, 
you'd do this:

```
[![Twitter logo](bird.svg)](https://twitter.com)
```

Or to get a sample image from the Poco directory and
use it in a header (you'd also have to alter the CSS for 
`img` tags in the header):

```
* [![image-text](../.poco/img/twitter-20px-blue.svg)](https://twitter.com)
```

## YouTube videos

PocoCMS supports a nonstandard extension to Markdown that
detects Youtube videos and gives them an embedded player. The
syntax is identical to image links in Markdown:

```
Here's a helpful tutorial:
![](https://www.youtube.com/watch?v=dQw4w9WgXcQ)
```


