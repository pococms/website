---
aside: docs/gs-aside.md
---

# Displaying code in Markdown

If you're writing technical documentation you may want a way to delineate blocks of 
code, sometimes known as a *code fence*. The result is also known as a *code block*.

### Creating a code block, aka code fence

The simplest way to show code is to wrap it between two lines consisting of 3 backticks in a row:
    
    ```
    title: Welcome to Example.com
    ```

And the result would be:

```
 title: Welcome to Example.com
```

You can get exactly the same effect by preceding each line of code with exactly 4 spaces.


### Keyword highlighting for computer languages

Suppose you're documenting YAML. You could follow the 3 backticks with the word `yaml`
to show it with keyword highlighting:

    ```yaml
    title: Welcome to Example.com
    ```
 The published result would show like this:
 
````yaml
 title: Welcome to Example.com
````
 
Many, many languages are supported. Here are a few examples:

#### bash

Markdown source:

    ```bash
    echo hello, world.
    ```
Published result:

```bash
 echo hello, world.
``` 
#### Javascript

Markdown source:

    ```js
    document.write('hello, world.')
    ```
    
Published result:

```js
document.write('hello, world.)
```
  
#### Markdown 
 
Markdown source:

     ```markdown
      ### hello, world.
     ```
    
Published result:

```markdown
### hello, world.
```
 
#### Markdown (alternative)
 
Markdown source:

     ```md
      ### hello, world.
     ```
    
Published result:

```md
### hello, world.
```
 
#### Python
 
Markdown source:

    ```python
    print("hello, world.")
    ```

Published result:

```python
print("hello, world.")
```

### Languages supported

There are too many languages to make an exhaustive list here, but you can find them
in the PrismJS source file [components.json](https://github.com/PrismJS/prism/blob/master/components.json)
under `languages`.

Here are the most common ones.
 
| Language      | Tag          |
| ------------- |:-------------| 
| Applecript    | applescript  |
| Asciidoc      | asciidoc     |
| ASP.NET       | aspnet       |
| batch files   | batch        |
| CSS           | css          |
| Go            | go           |
| HTTP          | http         |
| Java          | java         |
| Javascript    | js           |
| JSON          | json         |
| Markup        | markup       |
| Markdown      | markdown     |
| Markdown      | md           |
| Objective-C   | objectivec   |
| PHP           | php          |
| Powershell    | powershell   |
| Python        | py           | 
| Ruby          | ruby         |
| SASS          | sass         |
| SQL           | sql          |
| Swift         | swift        |
| VB.NET        | vbnet        |
| Vim           | vim          |
| Wiki          | yaml         |

Complete list can be found in the "languages" node of 
the PrismJS source file [components.json](https://github.com/PrismJS/prism/blob/master/components.json).

###### [Previous:  Tables in Markdown](gs-tables-in-markdown.html) 

