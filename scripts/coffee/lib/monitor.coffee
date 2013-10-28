
createAggregator = require 'when/monitor/aggregator'
throttleReporter = require 'when/monitor/throttledReporter'
simpleReporter = require './reporter'
formatter = require './formatter'
stackFilter = require 'when/monitor/stackFilter'
logger = require './logger'

mergePromiseFrames = ->

	filteredFramesMsg

exclude = (line) ->

	rx = attachPoint.promiseStackFilter or excludeRx

	return rx.test(line)

rejectionMsg = '--- Unhandled rejection escaped at ---'
reasonMsg = '--- Caused by reason ---'
filteredFramesMsg = '  ...[filtered frames]...'

excludeRx = /when\.js|when\/monitor\//i
filter = stackFilter(exclude, mergePromiseFrames)
reporter = simpleReporter(formatter(filter, rejectionMsg, reasonMsg), logger)

aggregator = createAggregator(throttleReporter(250, reporter))

attachPoint = if (typeof console isnt 'undefined') then aggregator.publish(console) else aggregator