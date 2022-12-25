# Todo


## Features

* Need to get functions working if I want to support toc,
among other things

## Themes

* Fill out [Paperboard theme demo](docs/demos/paperboard.html), 
source at docs/demos/paperboard.md and docs/demos/paperboard-aside.md
* Collect footer CSS, at least from Metabuzz
* Try to get this to working
```

ol {
  list-style: circle outside;
}

ol li {
    font-size:2rem;
    display:block;
    line-height:3em;
    padding-left: 4em; /* Distance from bullet to text */
    list-style: none;
    overflow: hidden;
    counter-reset: numList;
    width: 100%;
    display: block;
    float: left;
    position: relative
}

ol li:before {
    counter-increment: numList;
    content: counter(numList);
    float: left;

    position: absolute;
    left: 0em; /* Increase to move bullet to right  */
    text-align: center;
    color: #fff;
    line-height: 3em;

    width: 3em;
    height: 3em;
    background:red;
    -moz-border-radius: 999px;
    border-radius: 999px
}


```

```
ol {
    display: block;
    padding: 0 0 0 2em;
    list-style: none;
    background: #ccc;
    overflow: hidden;
    counter-reset: numList;
}
ol li {
    /* width: 176px; */
    /* margin-right: 3.5em; */ /* 44px; */
    float: left;
    position: relative
}

ol li:before {
    counter-increment: numList;
    content: counter(numList);
    
    float: left;
    position: absolute;
    left: -3em; /* -26px; */
    
    /* font: bold 12px sans-serif; */
    text-align: center;
    color: #fff;
    line-height: 3em; /* 18px; */
    
    width: 3em; /* 18px; */ height: 3em; /* 18px; */
    background: #f0f;
    
    -moz-border-radius: 999px;
    border-radius: 999px
}
```


## Documentation

* Write [workflow.md](docs/workflow.html), [Next Steps](docs/next-steps.html)
* Figure out how to standardize theme documentation

