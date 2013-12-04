## (ZooniverseML)
ZooniverseML (or **ZML**) is a small [ML](http://en.wikipedia.org/wiki/ML_%28programming_language%29)-inspired programming language specifically intended for use with the Zooniverse dashboard. It is fully-featured lazy-evaluted functional programming language including support for modules, static-typing with Hindley-Milner Type inference, and pattern matching. As it main purpose is to query and manipulate data, it has some features specifically to make those easier. 

ZML is designed to be beginner friendly with prescriptive errors thanks to its static type inference, and a standard library configured around making the Dashboard as simple to use as possible. 

### Implementation
The current main implementation is zml.js a JavaScript interpreter. I am also planning a Clojure interpreter. 

### Standard Library
The Standard Library will mostly contain functions for manipulating ZML's sequence types

### Examples
Writing a comment

      ; Anything after a semi-colon in a line is comment!

Assigning a variable

      let x = 1  ; x (Int) = 0 

Making a Vector
    
      let x = [1 2 3 4 5] ; x (Vec[Int]) = [1, 2, 3, 4, 5]

Making a Map

      let x = {a: 1 2: "b" c: 123.2} ; x (Map[a: Int, 2: Str, c: Float]) = {a: 1, 2: "b", c: 123.2}

Accessing a Field in a Map

      x.a ; (Int) 1
      x.b ; (Str) "b"

Declaring a simpe function

      let add2 = fn x => x + 2 ; x (Int -> Int) = function

Function Application

      add2(2) ; (Int) 4

With some sugar

      letfn add2 x => x + 2 ; x (Int -> Int) = function

A Function with Pattern Matching

      letfn map f, [] => []
          | map f, x:xs => cons(f(x), map(f, xs)) ; map (('a -> 'b, Seq['a]) -> Seq['b]) = function

There is variable called `_env` automatically included. It is a data in the current environment, such as a dashboard collection. 
      
      _env ; Table[a: Int, 2: Str, c: Float] ([{a: 1, 2: "c", c: 1.4}, {a: 1, 2: "asdf", c: 3.5]})
      map(fn x => {add2(x.a), x.2 x.c}, _env) ; Table[a: Int, 2: Str, c: Float] ([{a: 3, 2: "c", c: 1.4}, {a: 3, 2: "asdf", c: 3.5]})

Of course you can declare your own types. And they can be recursive

      lettype Point = {x: Float, y: Float}
      lettype PointList = {head: Point, tail: PointList}

And instantiate your type

      let p = Point(123.234, 8790.123)
      let ps = PointList(p, PointList(p))

Of course if you were making a listType you'd probably prefer it to just implement the Seq Interface

      exttype Seq 