require './_prepare'

wn = require 'when'
PrettyMonitor = mod 'PrettyMonitor'
PromiseMonitor = require 'when/monitor/PromiseMonitor'

promiseMonitor = new PromiseMonitor new PrettyMonitor

promiseMonitor.monitor wn.Promise

# let's just make do with this non-test-case for now
wn().then ->

	throw Error "This unhandled rejection is caught, which means PrettyMonitor is working"