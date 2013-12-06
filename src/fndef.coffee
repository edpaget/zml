class FnDef
  constructor: (vars, exps) ->
    @fn new Fn(vars, exps)

  eval: (env) ->
    @fn

module.exports = FnDef
