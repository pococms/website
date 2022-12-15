# Style tags

While you can include whole stylesheets, in the front
matter, you can also override individual styles
with style tags. 

Because there can be multiple styles, they're listed
one per line.  Be sure to surround them with double
quotes as shown in the example below.

Here's an example that turns all the `<h1>` header text blue,
and makes all the `<h3>` headers in the aside italic.

```yaml
    ---
    style-tags:
    - "article>h1{color:blue;}"
    - "aside>h3{font-style:italic;}"
    ---

# This  headline is blue!

```

