# Pretty Monitor

Pretty Monitor is a small debug utility that'll catch escaped [when.js](https://github.com/cujojs/when) rejections in node.js apps and dumps them in a readable format.

Screenshot
-----------

This is similar to when.js's default monitoring tool: `when/monitor/console.` Here is a screenshot of the original tool:

![screenshot of when/monitor/console](https://github.com/AriaMinaei/pretty-monitor/raw/master/docs/images/when-console-screenshot.png)

Pretty Monitor does the same thing with some formatting:

![screenshot of Pretty Monitor](https://github.com/AriaMinaei/pretty-monitor/raw/master/docs/images/pretty-monitor-screenshot.png)


Usage
-----

First, install with npm:

	npm install pretty-monitor

And then require it somewhere in your code, and you're good to go!
```javascript
require('pretty-monitor').start();
```

Example
-------

This would be a simple example:
```javascript
var wn = require('when');
require('pretty-monitor').start();

wn().then(function(){
	someNonExistingFunction();
});
```

Customization
-------------

Pretty Monitor simply turns when.js rejections into js errors, and to render them, it uses [Pretty Error](https://github.com/AriaMinaei/pretty-error), which is very customizable.

### Theming
You can customize the appearance of the log using simple css-like commands:
```javascript
prettyMonitor = require('pretty-monitor');

prettyError = prettyMonitor.start(); // start() returns an instance of PrettyError

// here, we will change the appearance of the log...
prettyError.appendStyle({

	// ... using css selectors ...
	'pretty-error > header > message': {

		// ... with css properties ...
		background: 'red',

		padding: '0 1'

	},

	'pretty-error > header > title > kind': {

		background: 'none',

		color: 'grey'

	}

});
```
... which results in:
![themed screenshot](https://github.com/AriaMinaei/pretty-monitor/raw/master/docs/images/themed-screenshot.png)

### Manipulating the contents of the log

[Pretty Error](https://github.com/AriaMinaei/pretty-error) allows a bunch of customizations on the contents of its logs. Here is one example:
```javascript
// this line substitutes a long path in the stack trace with a short string, making our log a little bit tidier:
prettyError.alias('E:/open-source/theatrejs/scripts/js', '(Theatre.js)');
```
And the result would look like:
![aliased screenshot](https://github.com/AriaMinaei/pretty-monitor/raw/master/docs/images/aliased-screenshot.png)

Take a look at [Pretty Error's docs](https://github.com/AriaMinaei/pretty-error) for more examples.

## State of The Project

