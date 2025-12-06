(define (problem BW-rand-5)
(:domain blocksworld)
(:objects o3 o2 o1 o5 o4 )
(:init
(p3)
(p4 o3 o2)
(p4 o2 o5)
(p2 o1)
(p4 o5 o1)
(p2 o4)
(p5 o3)
(p5 o4)
)
(:goal
(and
(p4 o3 o5)
(p2 o2)
(p4 o1 o4)
(p4 o5 o2)
(p2 o4))
)

(:constraints
  (sometime-before (p2 o2) (p4 o3 o5))
)
)