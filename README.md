# Pretty Monitor

	Pretty Monitor is a small debug utility that'll catch escaped rejections in node.js apps that use [when](https://github.com/cujojs/when) and presents them with little clutter.

Screenshots
-----------

	This is somewhat complementary to when.js's default monitoring tool, `when/monitor/console`. Here is a screenshot of the   original tool:

	![screenshot of when/monitor/console](https://raw.github.com/AriaMinaei/pretty-monitor/docs/images/when-console-screenshot.png)

	Pretty Monitor does the same thing with some formatting:

	![screenshot of Pretty Monitor](https://raw.github.com/AriaMinaei/pretty-monitor/docs/images/pretty-monitor-screenshot.png)

Installation
------------

	Install with npm
	```npm install pretty-monitor```

Usage
-----


	```
	require('pretty-monitor').start();
	```