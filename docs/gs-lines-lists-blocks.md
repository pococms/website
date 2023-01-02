---
aside: docs/gs-aside.md
---

# Lines, lists, and blocks of text in Markdown

Markdown has extensive coverage "blocks" of text, such as lists, block quotes, and horizontal rules.

## Markdown usually treats multiple blank lines as one

One thing that's a little hard to get used to is that in Markdown, 
multiple blank lines are
normally treated as one blank line. Take this markdown for example:

##### Markdown:

```
Line 1

Line 3?



Line 7?
```

##### Result:

Line 1

Line 3?



Line 7?


## Markdown: two adjacent lines of text 

Like HTML, Markdown considers the end of a line of text to be 
equivalent to a space.
Let's take a look.

##### Markdown:

```
who found you in the green forest
and were you very sorry to come away?
```

##### Result:

who found you in the green forest
and were you very sorry to come away?

This turns out to be very useful when you're writing large amounts of
documentation. Partly because it's the way HTML
behaves anyway, but also because it helps tools "pour" text into paragraphs
that adjust according to the size of your screen.

### Forcing two consecutive lines to appear that way

Now, suppose you're a [brilliant poet](https://www.poetryfoundation.org/poems/47304/little-tree) and
want your lines to be split a particular way? The key is to end each line with two spaces or a backslash (`\`).
Here the spaces are represented by dots.

##### Markdown:

```
NOTE: In this example the ⋅ dot represents the space character

who found you in the green forest⋅⋅
and were you very sorry to come away?
```

##### Result:

who found you in the green forest  
and were you very sorry to come away?


## Markdown Lists

HTML (and therefore Markdown) recognizes two kinds of lists: unordered (bullet lists),
and ordered (numbered lists).

### Markdown unordered list syntax

Unordered list items start the line with an asterisk and a space (`* `):

##### Markdown:


```
* Try rebooting.
* In the likely event that doesn't work, smash it with a hammer.
```

##### Result:

* Try rebooting.
* In the likely event that doesn't work, smash it with a hammer.

### Alternate unordered list syntax

You can also use `+` or `-` along with `*` to create an unordered list:

Markdown alternatives for unordered lists:

```
* The asterisk
+ The plus sign
- The minus sign
```

##### Result:

* The asterisk
+ The plus sign
- The minus sign


### Markdown ordered list syntax

Ordered list items start the line with a number, a period and a space (`1. `):

##### Markdown:

```
1. Eddie Van Halen
1. John Mayer
```

##### Result:

1. Eddie Van Halen
1. John Mayer

### Markdown indented list syntax: nested lists

You can nest lists by indenting with two spaces per level.

##### Markdown:

```
NOTE: In this example the ⋅ dot represents the space character

* First level of identation

⋅⋅* Second level of indentation
⋅⋅* More about second level
⋅⋅* Look ma, 3 items!

⋅⋅⋅⋅* Third level of indentation?
⋅⋅⋅⋅* Only two items to see here

⋅⋅⋅⋅⋅⋅* Fourth level?
⋅⋅⋅⋅⋅⋅* Not sure how deep lists can be nested
* A return to the first-level list 
```

##### Result:

* First level of identation

  * Second level of indentation
  * More about second level
  * Look ma, 3 items!

    * Third level of indentation?
    * Only two items to see here

      * Fourth level?
      * Not sure how deep lists can be nested
* A return to the first-level list 

    

Testing 2 lines:

Line 1  
Line 2

Line 1 without spaces at the end
Line 2

### Markdown indented list syntax: indenting text

You can indent text under a list item by preceding it with 3 spaces, like this: 

##### Markdown:

```
1. Eddie Van Halen

  Some would say he's not the best. But they're defective people.
1. John Mayer
```

##### Result:

1. Eddie Van Halen

   Some would say he's not the best. But they're defective people.
1. John Mayer

## Block quotes

To set off a reasonably large passage of text you may prefer to use *block quote* syntax,
which is simply starting a line with the greater than symbol (`>`):

##### Markdown:

```

As the great Tony Stark once said:

> I'm a huge fan of the way you lose control and turn into an enormous green rage monster.
```

##### Result:

As the great Tony Stark once said:

> I'm a huge fan of the way you lose control and turn into an enormous green rage monster.

Multiple `>` symbols on successive lines work together as one:

##### Markdown:

```
As the great Tony Stark once said:

> I'm a huge fan of the way you lose control 
> hand turn into an enormous green rage monster.
```

##### Result:

As the great Tony Stark once said:

> I'm a huge fan of the way you lose control 
> and turn into an enormous green rage monster.



## Horizontal lines (aka horizontal rules)


```
Asterisks:

***

Hyphens:

---

Underscores:

***
```

##### Result:

Asterisks:

***

Hyphens:

---

Underscores:

***



###### [Previous: Formatting characters in Markdown](gs-formatting-characters-in-markdown.html) [Next: Tables in Markdown](gs-tables-in-markdown.html)

