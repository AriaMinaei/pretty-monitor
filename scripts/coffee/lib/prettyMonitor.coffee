whenMonitor = require 'when-monitor'

globalRenderer = null

makeRenderer = ->

	PrettyError = require 'pretty-error'

	r = new PrettyError

	r.skipNodeFiles()

	r.skipPackage 'pretty-monitor'

	r.appendStyle 'pretty-error':

		marginLeft: 2

	r

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

			globalRenderer.render rejection, yes

		return

	globalRenderer