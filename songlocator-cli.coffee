###

  Command line interface for SongLocator.

  2013 (c) Andrey Popp <8mayday@gmail.com>

###

{readFileSync} = require 'fs'
{ResolverSet, rankSearchResults} = require 'songlocator-base'

exports.readConfigSync = (filename = './songlocator.json') ->
  try
    JSON.parse readFileSync(filename)
  catch e
    undefined

exports.parseArguments = (argv = process.argv) ->
  argv = argv.splice(2)
  args = []
  opts = {config: undefined, resolvers: [], debug: false}
  while argv.length > 0
    arg = argv.shift()

    if arg == '-c' or arg == '--config'
      opts.config = argv.shift()

    else if arg == '--debug'
      opts.debug = true

    else if arg.substring(0, 6) == '--use-'
      opts.resolvers.push(arg.substring(6))

    else
      args.push(arg)

  {args, opts}
