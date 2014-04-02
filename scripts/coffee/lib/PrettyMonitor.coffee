PrettyError = require 'pretty-error'

module.exports = class PrettyMonitor

	constructor: (@_prettyError = self._instantiatePrettyError()) ->

	getPrettyError: -> @_prettyError

	log: (traces) ->

		return unless Array.isArray traces

		for trace in traces

			@logTrace trace

		return

	logTrace: (trace) ->

		firstLine = trace[0]

		kind = 'Rejection'

		if match = firstLine.match /^([a-zA-Z0-9]+)\: /

			kind = match[1]

			firstLine = firstLine.substr match[0].length, firstLine.length

		console.error @_prettyError.render

			wrapper: 'Escaped'

			kind: kind

			message: firstLine

			stack: trace.join '\n'

		return

	self = @

	@_instantiatePrettyError: ->

		pe = new PrettyError

		pe.skipNodeFiles()

		pe.appendStyle 'pretty-error':

			marginTop: 1

		pe