additionalStyle = require './PrettyWhenMonitor/additionalStyle'
# ParsedError = require './ParsedError'
# RenderKid = require 'RenderKid'
# {object} = require 'utila'

PrettyError = require 'pretty-error'

module.exports = class PrettyWhenMonitor

	self = @

	constructor: ->

		@_prettyError = new PrettyError

		@appendStyle additionalStyle

	_getStyle: ->

		@_prettyError.style

	appendStyle: (toAppend) ->

		@_prettyError.appendStyle toAppend

		@

	_getRenderer: ->

		@_prettyError.renderer

	render: (e, logIt = no, skipModules = no) ->



	getObject: (e, skipModules = no) ->



for prop in ['renderer', 'style'] then do ->

	methodName = '_get' + prop[0].toUpperCase() + prop.substr(1, prop.length)

	PrettyWhenMonitor::__defineGetter__ prop, -> do @[methodName]