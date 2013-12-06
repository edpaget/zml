class Let
  constructor: (@var, @exp) ->

  eval: (env) ->
    env.add(@var. @exp)

module.exports = Let
