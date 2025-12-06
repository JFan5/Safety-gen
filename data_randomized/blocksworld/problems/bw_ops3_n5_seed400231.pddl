(define (problem BW-rand-5)
(:domain blocksworld)
(:objects o3 o2 o1 o5 o4 )
(:init
(p3)
(p2 o3)
(p4 o2 o3)
(p4 o1 o5)
(p4 o5 o2)
(p2 o4)
(p5 o1)
(p5 o4)
)
(:goal
(and
(p4 o3 o5)
(p4 o2 o4)
(p2 o1)
(p2 o5)
(p4 o4 o1))
)

(:constraints
  (sometime-before (p4 o2 o4) (p4 o3 o5))
)
)