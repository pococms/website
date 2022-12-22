# Style tags

While you can include whole stylesheets, in the front
matter, you can also override individual style rules
using `styles` in the front matter.

Because there can be multiple styles, they're listed
one per line.  **Be sure to surround them with double
quotes** as shown in these examples.

Here's an example that turns all the `<h1>` header text blue,
and makes all the `<h3>` headers in the aside italic.

      ---
      style-tags:
      - "article>h1{color:blue;}"
      - "aside>h3{font-style:italic;}"
      ---

      # This  headline is blue!


These get inserted last when the site is generated, which means that they
take priority. In the example above, all h1 text will be rendered
as blue.


## Avoiding double-quotes inside of style rules

CSS itself doesn't care if you surround CSS attribute values with single or double quotes, 
but it can interfere with the quotes used in `styles`. 

For example, take the normal CSS rule:

      p {font-family:Cambria, "Hoefler Text", Utopia, "Liberation Serif", "Nimbus Roman No9 L Regular", Times, "Times New Roman", serif;}


If you wanted to convert it to a style rule you might try this:


      ---
      # DON'T DO THIS. NEST DOUBLE QUOTES ARE ASKING FOR TROUBLE
      styles:
      - "p {font-family:"Hoefler Text", "Nimbus Roman No9 L Regular", serif;}"
      ---


As you can see trying to nest double quotes (such as `"Hoefler Text"` and `"Nimbus Roman No9 L Regular"`
inside the `styles` rule is problematic. Instead, use double-quotes only 
on the outside of the rule, and single-quotes inside:

      ---
      # Ah.... much better
      styles:
      - "p {font-family:'Hoefler Text', 'Nimbus Roman No9 L Regular', serif;}'
      ---


