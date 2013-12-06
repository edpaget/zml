class FnCall
  constructor: (@fnExp, @argExps...) ->

  eval: (env) ->
    fn = @fnExp.eval(env)
    fnScope = fn.vars.reduce(((fnScope, v, i) -> 
      fnScope.add(v, @argExps[i])), env.newScope())
    fn.eval(fnScope)

module.exports = FnCall
