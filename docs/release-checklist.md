# PocoCMS release checklist

* Change to the poco directory
* go build
* go test
* Check quickly through the source code
* go fmt
* Run all stylesheets through `vnu` via my `v` utility
* `du -h` on the source directory
* `tree` on the source directory
* Check document Markdown source code for ocurrences of TODO:, 
including as comments in Go template format
* Run poco in the poco directory
* Run the test scripts `/.ts1` `/.ts2` in the poco directory
* cd ~/pococms/website and run `poco-dir-update`

## Check for assets
* In the website/docs/img-sample-gordon-house-224x168.jpg


## Interactive theme tests
* For each theme click all links in all page layout elements

