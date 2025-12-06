(define (problem ferry-o7-c3)
(:domain ferry)
(:objects o4 o6 o1 
          o2 o3 o5 
)
(:init
(p2 o4)
(p2 o6)
(p2 o1)
(p4 o2)
(p4 o3)
(p4 o5)
(p7 o4 o6)
(p7 o6 o4)
(p7 o4 o1)
(p7 o1 o4)
(p7 o6 o1)
(p7 o1 o6)
(p5)
(p3 o2 o1)
(p3 o3 o1)
(p3 o5 o6)
(p1 o6)
)
(:goal
(and
(p3 o2 o1)
(p3 o3 o6)
(p3 o5 o1)
)
)

(:constraints
  (and
    (sometime-before  (p3 o3 o6) (p1 o4))
    (sometime-before  (p3 o5 o1) (p1 o4))
  )
)
)