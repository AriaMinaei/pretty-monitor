whenMonitor = require 'when-monitor'

getRenderer = ->

	PrettyError = require 'pretty-error'

	r = new PrettyError

	r.appendStyle 'pretty-error':

		marginLeft: 2

	r

deployed = no

module.exports = (interval = 100, renderer = null, skipModules = [], maxTraceItems = 100) ->

	skipModules.push 'pretty-monitor'

	return if deployed

	deployed = yes

	unless renderer?

		renderer = getRenderer()

	whenMonitor parseInt(interval), (rejections) ->

		for rejection in rejections

			renderer.render rejection, yes, skipModules, maxTraceItems

		return

	return