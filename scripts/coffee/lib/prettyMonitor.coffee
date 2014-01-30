whenMonitor = require 'when-monitor'

globalRenderer = null

makeRenderer = ->

	PrettyError = require 'pretty-error'

	pe = new PrettyError

	pe.skipNodeFiles()

	pe.skipPackage 'pretty-monitor'

	pe.appendStyle 'pretty-error':

		marginLeft: 2

	pe

deployed = no

module.exports.start = (interval = 100, renderer = null) ->

	return globalRenderer if deployed

	deployed = yes

	if renderer?

		globalRenderer = renderer

	else

		globalRenderer = makeRenderer()

	whenMonitor.start parseInt(interval), (rejections) ->

		for rejection in rejections

			console.log globalRenderer.render rejection, no

		return

	globalRenderer