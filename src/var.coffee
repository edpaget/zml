class Var
  constructor: (@name) ->

  eval: (env) ->
    env.lookup(@name)

module.exports = Var
