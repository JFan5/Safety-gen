(define (problem BW-rand-6)
(:domain blocksworld)
(:objects o3 o2 o1 o5 o4 o6 )
(:init
(p3)
(p2 o3)
(p2 o2)
(p4 o1 o5)
(p4 o5 o3)
(p2 o4)
(p4 o6 o2)
(p5 o1)
(p5 o4)
(p5 o6)
)
(:goal
(and
(p4 o3 o2)
(p4 o2 o6)
(p2 o1)
(p2 o5)
(p4 o4 o3)
(p2 o6))
)

(:constraints
  (sometime-before (p4 o2 o6) (p4 o3 o2))
)
)