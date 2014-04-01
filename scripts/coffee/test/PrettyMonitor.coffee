require './_prepare'

wn = require 'when'
PrettyMonitor = mod 'PrettyMonitor'
PromiseMonitor = require 'when/monitor/PromiseMonitor'

console.promiseMonitor = new PromiseMonitor new PrettyMonitor

wn().then ->

	throw Error "This unhandled rejection is caught, which means PrettyMonitor is working"