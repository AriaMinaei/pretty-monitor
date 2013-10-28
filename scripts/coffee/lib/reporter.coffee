module.exports = (format, log) ->

	len = 0

	return (promises) ->

		promises = filterAndFormat(format, promises)

		if len is 0 and promises.length is 0

			return

		# inspect promises


		try

			log(promises)

		finally

			len = promises.length

filterAndFormat = (format, promises) ->

	rejected = []

	for key of promises

		rec = promises[key]

		if rec.rejectedAt

			rejected.push(format(rec))

	return rejected
