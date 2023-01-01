# Building a project in another directory

You normally invoke PocoCMS from the command line something like this:

* Create a new site, change to its directory, and run
the built-in webserver:

```
poco -new /path/to/your/site
cd  /path/to/your/site
poco -serve
```

Or if the project already exists:

* Build site from inside its directory

```
cd  /path/to/your/site
poco 
```

## Building poco in a remote directory

But you can actually build and run from any directory (you have
permission to be in), to another directory. Examples:

### Example 1: Generate site in remote directory

* Generate existing site remotely


```
poco /path/to/your/site
```

This deposites the generated files at [webroot](glossary.html#webroot) in the 
remote directory at `/path/to/your/site/WWW`


### Example 1: Generate site in remote directory and run webserver there

* Create a new site in remote directory, then run
the built-in webserver in that directory:

```
poco -new /path/to/your/site
poco -serve /path/to/your/site
```

