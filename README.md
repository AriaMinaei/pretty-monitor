# PrettyMonitor
[![Build Status](https://secure.travis-ci.org/AriaMinaei/pretty-monitor.png)](http://travis-ci.org/AriaMinaei/pretty-monitor)

PrettyMonitor is a small debug utility that catches escaped [when.js](https://github.com/cujojs/when) rejections in node.js apps and renders them in a readable format.

## Screenshot

This is similar to when.js's default monitoring tool: `when/monitor/console.` Here is a screenshot of the original tool (as of when-3.1):

![screenshot of when/monitor/console](https://github.com/AriaMinaei/pretty-monitor/raw/master/docs/images/when-console-screenshot.png)

PrettyMonitor does the same thing with some formatting:

![screenshot of PrettyMonitor](https://github.com/AriaMinaei/pretty-monitor/raw/master/docs/images/pretty-monitor-screenshot.png)

## Usage (in `when-3.x`)

Install with npm:

	npm install pretty-monitor

And in your javascript:
```javascript
// require the dependencies first:
wn = require('when');
PrettyMonitor = require('pretty-monitor');
PromiseMonitor = require('when/monitor/PromiseMonitor');

// then, instantiate the monitor:
promiseMonitor = new PromiseMonitor(new PrettyMonitor());

// ... and start it:
promiseMonitor.monitor(wn.Promise);

// to see a sample rejection:
wn().then(function(){
	// this will throw an error and cause a rejection which won't be handled.
	// PrettyMonitor will log this rejection to the console.
	someNonExistingFunction();
});
```

#### Note on `when-3.1`

The monitoring api on `when-3.1` looks a tiny bit different:
```javascript
// require the dependencies first:
wn = require('when');
PrettyMonitor = require('pretty-monitor');
PromiseMonitor = require('when/monitor/PromiseMonitor');

// this is the different part:
console.promiseMonitor = new PromiseMonitor(new PrettyMonitor());

// to see a sample rejection:
wn().then(function(){
	// this will throw an error and cause a rejection which won't be handled.
	// PrettyMonitor will log this rejection to the console.
	someNonExistingFunction();
});
```

## Usage (in `when-2.x`)

Install with npm:

	npm install pretty-monitor@0.1.7

And then require it somewhere in your code:
```javascript
require('pretty-monitor').start();

// to see a sample rejection:
var wn = require('when');
require('pretty-monitor').start();

wn().then(function(){
	// this will throw an error and cause a rejection which won't be handled.
	// PrettyMonitor will log this rejection to the console.
	someNonExistingFunction();
});
```

## Customization

PrettyMonitor uses [PrettyError](https://github.com/AriaMinaei/pretty-error) to render the rejections. PrettyError is very customizable. You can set themes, customize layout and colors, and simplify the stack trace. There are a bunch of examples at [PrettyError's docs](https://github.com/AriaMinaei/pretty-error), so, make sure to check them out.

To access the PrettyError instance when using PrettyMonitor:
```javascript
prettyError = prettyMonitor.getPrettyError();

// if you're using pretty-monitor@0.1.x:
prettyError = prettyMonitor.start();
```

## State of The Project

This is a work in progress. I'll try to fix bugs and keep it up-to-date with when.js. Feel free to open an issue if something isn't working, and of course, Pull Requests are more than welcome :)

## License
MIT