(define (problem BW-rand-6)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 )
(:init
(arm-empty)
(on-table b1)
(on-table b2)
(on b3 b4)
(on b4 b2)
(on b5 b6)
(on b6 b1)
(clear b3)
(clear b5)
)
(:goal
(and
(on-table b1)
(on-table b2)
(on-table b3)
(on b4 b1)
(on-table b5)
(on b6 b2))
)

(:constraints
  (sometime-before (on-table b2) (on-table b1))
)
)