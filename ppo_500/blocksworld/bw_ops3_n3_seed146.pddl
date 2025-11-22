(define (problem BW-rand-3)
(:domain blocksworld)
(:objects b1 b2 b3 )
(:init
(arm-empty)
(on b1 b2)
(on b2 b3)
(on-table b3)
(clear b1)
)
(:goal
(and
(on-table b1)
(on b2 b1)
(on b3 b2))
)

(:constraints
  (sometime-before (on b2 b1) (on-table b1))
)
)