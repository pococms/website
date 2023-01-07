# PocoCMS release checklist

* Eventually start releasing w/out debug info. Add correct ldflags to gorelease? https://itnext.io/shrinking-go-executable-9e9c17b47a41
* Change to the poco directory
* go fmt
* go build
* go test
* Check quickly through the source code
* Run all stylesheets through `vnu` via my `v` utility
* `du -h` on the source directory
* `tree` on the source directory
* Check document Markdown source code for ocurrences of TODO:, 
including as comments in Go template format
* Run poco in the poco directory
* Run the test scripts `/.ts1` `/.ts2` in the poco directory
* Follow directions in the test scripts, notably looking for
  - Sidebars in both short and log documents
  - Themes in nested directories
* cd ~/pococms/website and run `poco-dir-update`
* Ahead of goreleaser, run `rm -rf ../downloads/dist`
* Get all cruft out of poco directory and run `goreleaser`
## Check for assets
* Am I still using
  - website/docs/img-sample-gordon-house-224x168.jpg

* Probably want to eliminate or replace these files, especially if I figure out how to get CSS working smoothly with SVG
	- .poco/img/facebook-14px-clear.svg
	- .poco/img/facebook-24px-blue.svg
	- .poco/img/twitter-14px-blue.svg
	- .poco/img/twitter-14px-clear.svg
	- .poco/img/youtube-14px-red.svg


## Interactive theme tests
* For each theme click all links in all page layout elements

