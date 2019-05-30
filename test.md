# Aufgabe 3

## a)

```
FV(\x -> if y then \z -> (x \y -> y) else (\z -> w) x)
= FV(if y then \z->(x\y->y) else (\z->w)x) \{x}
= (FV(y) ∪ FV(\z -> (x \y -> y)) ∪ FV((\z -> w) x)) \{x}
= ({y} ∪ (FV((x \y -> y)\{z})) ∪ (FV(\z -> w) ∪ FV(x))) \{x}
= ({y} ∪ ((FV(x) ∪ FV(\y -> y))\{z}) ∪ ((FV(w)\{z}) ∪ {x})) \{x}
= ({y} ∪ (({x} ∪ (FV(y)\{y}))\{z}) ∪ (({w}\{z}) ∪ {x})) \{x}
= ({y} ∪ (({x} ∪ ({y}\{y}))\{z}) ∪ (({w}\{z}) ∪ {x})) \{x}
= ({y} ∪ (({x} ∪ ∅)\{z}) ∪ ({w} ∪ {x})) \{x}
= ({y} ∪ ({x} ∪ {w,x})) \{x}
= {y,x,w} \{x}
= {y,w}
```

```
GV(\x -> if y then \z -> (x \y -> y) else (\z -> w) x)
= GV(if y then \z->(x\y->y) else (\z->w)x) ∪ {x}
= (GV(y) ∪ GV(\z -> (x \y -> y)) ∪ GV((\z -> w) x)) ∪ {x}
= (∅ ∪ (GV((x \y -> y) ∪ {z})) ∪ (GV(\z -> w) ∪ GV(x))) ∪ {x}
= (GV(x) ∪ GV(\y -> y)) ∪ {z} ∪ (GV(w) ∪ {z} ∪ GV(x)) ∪ {x}
= (∅ ∪ GV(y) ∪ {y}) ∪ {z} ∪ (∅ ∪ {z} ∪ ∅) ∪ {x}
= (∅ ∪ ∅ ∪ {y}) ∪ {z} ∪ (∅ ∪ {z} ∪ ∅) ∪ {x}
= {y, z, x}
```

## b)

```
FV(let f x1 x2 =y1 (\x->x2)in let y1 = f w (f y2 y2) ,y2 =y1 in f)
= FV(let f=\x1x2->y1(\x->x2)in let y1= f w (fy2y2) ,y2=y1in f)
= (FV(\x1 x2 -> y1 (\x -> x2)) ∪ FV(let y1 = f w (f y2 y2),y2 = y1 in f))\{f}
= ((FV(y1 (\x -> x2))\{x1,x2}) ∪ ((FV(f w (f y2 y2)) ∪ FV(y1) ∪ FV(f))\{y1,y2}))\{f}
= (((FV(y1) ∪ (FV(x2)\{x}))\{x1,x2}) ∪ ((FV(f) ∪ FV(w) ∪ FV(f y2 y2) ∪ FV(y1) ∪ FV(f))\{y1,y2}))\{f}
= ((({y1} ∪ ({x2}\{x}))\{x1,x2}) ∪ ((({f} ∪ {w} ∪ FV(f) ∪ FV(y2) ∪ FV(y2)) ∪ {y1} ∪ {f})\{y1,y2}))\{f}
= (({y1,x2} \ {x1,x2})  ∪  (({f}  ∪  {w}  ∪  {f}  ∪  {y2}  ∪  {y2}  ∪  {y1}  ∪  {f}) \ {y1,y2})) \ {f}
= ({y1}  ∪  ({f, w, y2, y1} \ {y1, y2})) \ {f}
= ({y1} ∪ {f,w})\{f}
= {y1,w}
```

```
GV(let f x1 x2 =y1 (\x->x2)in let y1 =f w(f y2 y2),y2 =y1 in f)
= GV(let f =\x1 x2 ->y1 (\x->x2)in let y1 =f w(f y2 y2),y2 =y1 in f)
= GV(\x1 x2 -> y1 (\x -> x2)) ∪ GV(let y1 = f w (f y2 y2),y2 = y1 in f ) ∪{f}
= GV(y1 (\x -> x2)) ∪ {x1,x2} ∪ GV(f w (f y2 y2)) ∪ GV(y1) ∪ GV(f) ∪ {y1,y2} ∪ {f}
= GV(y1) ∪ GV(\x -> x2) ∪ {x1,x2} ∪ GV(f) ∪ GV(w) ∪ GV(f y2 y2) ∪ GV(y1) ∪ GV(f) ∪ {y1,y2} ∪ {f}
= ∅ ∪ GV(x2) ∪ {x} ∪ {x1,x2} ∪ ∅ ∪ ∅ ∪ GV(f) ∪ GV(y2) ∪ GV(y2) ∪ ∅ ∪ ∅ ∪ {y1,y2} ∪ {f}
= ∅ ∪ {x} ∪ {x1,x2} ∪ ∅ ∪ ∅ ∪ ∅ ∪ {y1,y2} ∪ {f}
= {x, x1, x2, y1, y2, f}
```
