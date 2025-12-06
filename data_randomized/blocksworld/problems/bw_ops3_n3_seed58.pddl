(define (problem BW-rand-3)
(:domain blocksworld)
(:objects o3 o2 o1 )
(:init
(p3)
(p4 o3 o2)
(p2 o2)
(p4 o1 o3)
(p5 o1)
)
(:goal
(and
(p2 o3)
(p4 o2 o3)
(p4 o1 o2))
)

(:constraints
  (sometime-before (p4 o2 o3) (p2 o3))
)
)