class Fn
  constructor: (@vars, @exps) ->

  eval: (env) ->
    @exps.reduce(((env, ex) -> 
      ex.eval(env)), env)

