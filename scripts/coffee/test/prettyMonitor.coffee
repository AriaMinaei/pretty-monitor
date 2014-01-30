require './_prepare'

prettyMonitor = mod 'prettyMonitor'

pe = prettyMonitor.start 100

pe.unskipAllPackages()

wn = require 'when'

wn().then ->

	throw Error "This unhandled rejection is caught, which means PrettyMonitor is working"