(define (problem BW-rand-4)
(:domain blocksworld)
(:objects o3 o2 o1 o5 )
(:init
(p3)
(p2 o3)
(p4 o2 o1)
(p2 o1)
(p4 o5 o2)
(p5 o3)
(p5 o5)
)
(:goal
(and
(p4 o3 o5)
(p2 o2)
(p4 o1 o2)
(p4 o5 o1))
)

(:constraints
  (sometime-before (p2 o2) (p4 o3 o5))
)
)