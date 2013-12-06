[ 
  Let(Var(Var("x")), 0),
  Let(Var("x"), FnCall(Var("Vector"), 1, 2, 3, 4, 5)),
  Let(Var("x"), FnCall(Var("Map"), 'a', 1, 2, 'b', 'c', 123.2)),
  FnCall(Var("x"), "a"),
  FnCall(Var("x"), "b"),
  Let(Var("add2"), FnDef([Var("x")], [FnCall(Var("+"), Var("x"), 2)])),
  FnCall(Var("add2"), "2"),
  Let(Var("add2"), FnDef([Var("x")], [FnCall(Var("+"), Var("x"), 2)])),
  Let(Var("map"), FnDef([Var("f"), FnCall(Var("Empty"))], [FnCall(Var("Empty"))]
                        [Var("f"), Var("xs")], [Let(Var("x"), FnCall(Var("head"), Var("xs"))),
                                                Let(Var("xs"), FnCall(Var("tail"), Var("xs"))),
                                                FnCall(Var("cons"), FnCall(Var("f"), Var("xs")), FnCall(Var("map"), Var("xs")))]))
]