module.exports = (filterStack, unhandledMsg, reasonMsg) ->

	formatStackJumps = (rec) ->

		jumps = []

		rec = rec.parent

		while (rec)

			jumps.push(formatStackJump(rec))

			rec = rec.parent


		return jumps


	formatStackJump = (rec) ->

		return filterStack(toArray(rec.createdAt.stack).slice(1))


	stitch = (escaped, jumps, rejected) ->

		escaped = filterStack(toArray(escaped)).slice(1)

		rejected = filterStack(toArray(rejected))

		return [unhandledMsg].concat(escaped, jumps, reasonMsg, rejected)


	toArray = (stack) ->

		return if stack then stack.split('\n') else []

	return (rec) ->



		cause = rec.reason and rec.reason.stack

		if !cause

			cause = rec.rejectedAt and rec.rejectedAt.stack

		jumps = formatStackJumps(rec)

		formatted =

			reason: rec.reason,
			message: rec.reason and rec.reason.toString()
			escapedAt: rec.createdAt.stack
			jumps: jumps
			cause: cause

		return formatted