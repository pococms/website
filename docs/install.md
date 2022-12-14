---
hide: aside
---

# Installing PocoCMS

PocoCMS is just one file, so if you have a little experience
copying files and adding them to the path there's nothing to it.

**This part is a bit rough. Will improve it ASAP. Plan is to work up versions for**
* Homebrew tap
* scoop
* Apt/get?

## Grab the latest binary

* The easiest way to get PocoCMS is to find the latest version at
the [Downloads](https://github.com/pococms/downloads/tree/main/dist) page.

  Obviously it's best to copy that to your system path.

## Installing from source

* PocoCMS is written in Go, so you'll obviously need to download it
from the [Go homepage](https://go.dev).
* You'll need to install [Git](https://git-scm.com/downloads) to
download the source from GitHub. 
* Optional but highly recommended: PocoCMS is hosted on [GitHub](https://github.com/pococms/poco),
so you should probably [get an account on GitHub](https://github.com/signup).
* Then you install it as you would any other GitHub repo. Drop into the
terminal, then:

1. Change to the directory you want Git to be installed in. It will be generated in a subdirectory of that directory. For example, on Unix or Mac, it might
  be something like:
```
cd ~/code
```
2. Download the repo as you would any other repo:

```
git clone https://github.com/pococms/poco
cd poco
```
3. Compile!

```
go build
```
4. This will give you a `poco` in the current directory. Start your first project like this:

```
./poco ~/mysite
./poco -server ~/mysite
```
5. Paste the URL `http://localhost:54321` into your browser to see your first PocoCMS site.

6. When you get a moment, put `poco` on the system path as soon as possible.


