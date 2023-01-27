---
hide: aside
styles:
- "article>h3{padding-bottom:0;padding-top:1.5rem;}"
- "article>table{padding-top:0;margin-top:0;}"
# Make first (empty) row of table disappear
- "article>table>thead>tr>th{border:none;padding-top:0;}"
# Make first column of table boldface:
- "article>table>tbody>tr>td:first-child{font-weight:bold;}"
# Remove lines from all rows of table except header 
# "article>table>tbody>tr>td{border:none;}"
# Remove lines from table header. 
# "article>table>thead>tr>th{border:none;}"


---

# Installing PocoCMS

PocoCMS is just one file, so if you have a little experience
copying files and adding them to the path there's nothing to it.

## Grab the latest binary

### Macintosh
|  | | | |
| ---------------|-|-|-|
| AMD-64 | [Archive](https://github.com/pococms/downloads/tree/main/dist/poco_Darwin_x86_64.tar.gz) | [Executable](https://github.com/pococms/downloads/tree/main/dist/poco_darwin_amd64_v1/poco) | [Help](inst-help-mac.html) |
| ARM-64 | [Archive](https://github.com/pococms/downloads/tree/main/dist/poco_Darwin_arm64.tar.gz) | [Executable](https://github.com/pococms/downloads/tree/main/dist/poco_darwin_arm64/poco) | [Help](inst-help-mac.html) |


### Windows

|  | | |
| ---------------|-|-|
| AMD-64 | [Zipped](https://github.com/pococms/downloads/tree/main/dist/poco_Windows_x86_64.zip) | [Uncompressed .EXE](https://github.com/pococms/downloads/tree/main/dist/poco_windows_amd64_v1/poco.exe) |
| ARM 64-bit | [Zipped](https://github.com/pococms/downloads/tree/main/dist/poco_Windows_arm64.zip) | [Uncompressed .EXE](https://github.com/pococms/downloads/tree/main/dist/poco_arm_64/poco.exe) |
| 386 | [Zipped](https://github.com/pococms/downloads/tree/main/dist/poco_Windows_i386.zip) | [Uncompressed .EXE](https://github.com/pococms/downloads/tree/main/dist/poco_windows_386/poco.exe) |


### Linux

|  | | |
| ---------------|-|-|
| AMD-64 | [Archive](https://github.com/pococms/downloads/tree/main/dist/poco_Linux_x86_64.zip) | [Executable](https://github.com/pococms/downloads/tree/main/dist/poco_linux_amd64_v1/poco) |
| ARM 64-bit | [Archive](https://github.com/pococms/downloads/tree/main/dist/poco_Linux_arm64.tar.gz) | [Executable](https://github.com/pococms/downloads/tree/main/dist/poco_linux_arm64/poco) |
| 386 | [Archive](https://github.com/pococms/downloads/tree/main/dist/poco_Linux_i386.tar.gz) | [Executable](https://github.com/pococms/downloads/tree/main/dist/poco_linux_386/poco) |


## After downloading, try to copy the executable to your system path

The tutorial will work fine even if you just leave it in the `Downloads` directory though.

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


