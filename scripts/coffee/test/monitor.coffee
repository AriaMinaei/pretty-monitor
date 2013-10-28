require './_prepare'

monitor = mod 'monitor'

wn = require 'when'

wn().then ->

	throw Error "hello"