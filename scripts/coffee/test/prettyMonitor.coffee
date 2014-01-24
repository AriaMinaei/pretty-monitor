require './_prepare'

prettyMonitor = mod 'prettyMonitor'

pe = prettyMonitor.start 100

wn = require 'when'

wn().then ->

	a.b()