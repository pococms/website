# Creating a PocoCMS theme from scratch

## Creating the simplest possible theme

Let's create the simplest possible PocoCMS theme. Spoiler alert: it 
will do absolutely nothing. This is the first step in a progressive
series of theme building.


### Components of the simplest possible theme 

The minimum requirements for a theme are:

1. A subdirectory under `.poco/themes`. It will be used as the name of the theme
2. A `README.md` file in that subdirectory. It may be empty (and therefore useless)
3. A `LICENSE` file in that subdirectory.

### Creating the theme files

Let's build that minimal theme.

* Navigate to the [root directory](glossary.html#root-directory) of your
site and create a directory at `.poco/themes/t1`:

```
mkdir .poco/themes/t1
```

Note: the directory name is also the theme name.

* Create a file named `.poco/themes/t1/README.md`. That's right,
it's going to be empty at first.

* Create a file named `.poco/themes/t1/LICENSE`.
Populate it with a license determining how your user may profit from
and redistribute the file. For inspiration see GitHub's 
[LICENSE files](https://docs.github.com/en/communities/setting-up-your-project-for-healthy-contributions/adding-a-license-to-a-repository) or just grab [this one](https://github.com/pococms/poco/blob/main/LICENSE) and replace the copyright notice as needed.

### Using the theme

* That's it. To use the theme just edit your root `index.md` 
to use it:

```
---
theme: t1
---

Well? How do I look?
```

And the answer to that question is... whelming.

![Screenshot of a minimal, empty theme](img/minimal-t1-theme.png)

We can do much better with very little effort.

###### [Next: Add a classless stylesheet to your theme](th-add-classless-css.html)




