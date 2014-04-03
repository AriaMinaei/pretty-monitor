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

	configurePromiseMonitor: (pm) ->

		# leaving this empty until when@3.1 is final

	self = @

	@_instantiatePrettyError: ->

		pe = new PrettyError

		pe.skipNodeFiles()

		pe.skipPackage 'when'

		pe.filter (traceLine, lineNumber) ->

			# 'DynamicTimeline.module.exports.DynamicTimeline._verifyProp'
			if typeof traceLine.what is 'string'

				# we can shorten it with a regex:
				traceLine.what = traceLine.what.replace /(.*\.module\.exports\.)(.*)/, '$2'


			return

		pe.appendStyle 'pretty-error':

			marginTop: 1

		pe