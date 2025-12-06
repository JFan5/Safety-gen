(define (problem ferry-l4-o5)
(:domain ferry)
(:objects o4 o6 o1 o7 
          o2 o3 
)
(:init
(p2 o4)
(p2 o6)
(p2 o1)
(p2 o7)
(p4 o2)
(p4 o3)
(p7 o4 o6)
(p7 o6 o4)
(p7 o4 o1)
(p7 o1 o4)
(p7 o4 o7)
(p7 o7 o4)
(p7 o6 o1)
(p7 o1 o6)
(p7 o6 o7)
(p7 o7 o6)
(p7 o1 o7)
(p7 o7 o1)
(p5)
(p3 o2 o7)
(p3 o3 o4)
(p1 o6)
)
(:goal
(and
(p3 o2 o6)
(p3 o3 o1)
)
)

(:constraints
  (and
    (sometime-before  (p3 o2 o6) (p1 o4))
    (sometime-before  (p3 o3 o1) (p1 o7))
  )
)
)