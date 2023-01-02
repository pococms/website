# Todo

## Write
* steal markdown tutorial from vuepress & link to it from tutorial 

## Distribution
* Create formulas for choco, brew tap, apt get, etc.

## Test
* Run `poco -settings` on Windows. Will it show as on the path?
* Do this on a home page. Point is to 

```
stylesheets:
- "foo.css"
- "https://cdn.jsdelivr.net/npm/water.css@2/out/water.css"
- "../.poco/css/featuretable.css"
```

## Feature enhancements

* ts2: Make trashing the factory settings an option
```
echo "Stress test: Removing factory themes"
rm -rf /Users/tom/Library/Application\ Support/pococms/
```

* Allow `poco -settings` to run in the Poco directory
* Need to get functions working if I want to support toc,
among other things
* If you create a theme outside the Poco directory, `poco-theme-test` gets confused
* Fill out [Paperboard theme demo](docs/demos/paperboard.html), 
source at docs/demos/paperboard.md and docs/demos/paperboard-aside.md

## Themes

* Collect footer CSS, at least from Metabuzz
* Try to get `.poco/css/nav-menu.css` working

## Documentation

* Write [workflow.md](docs/workflow.html), [Next Steps](docs/next-steps.html)
* Figure out how to standardize theme documentation

