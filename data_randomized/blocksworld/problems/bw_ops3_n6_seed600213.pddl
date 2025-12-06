(define (problem BW-rand-6)
(:domain blocksworld)
(:objects o3 o2 o1 o5 o4 o6 )
(:init
(p3)
(p4 o3 o6)
(p4 o2 o1)
(p4 o1 o4)
(p4 o5 o2)
(p2 o4)
(p2 o6)
(p5 o3)
(p5 o5)
)
(:goal
(and
(p4 o3 o5)
(p2 o2)
(p2 o1)
(p2 o5)
(p4 o4 o6)
(p4 o6 o3))
)

(:constraints
  (sometime-before (p2 o2) (p4 o3 o5))
)
)