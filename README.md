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