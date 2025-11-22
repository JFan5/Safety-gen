(define (problem BW-rand-6)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 )
(:init
(arm-empty)
(on-table b1)
(on b2 b5)
(on-table b3)
(on b4 b2)
(on b5 b6)
(on b6 b3)
(clear b1)
(clear b4)
)
(:goal
(and
(on b1 b6)
(on-table b2)
(on b3 b1)
(on-table b4)
(on-table b5)
(on-table b6))
)

(:constraints
  (sometime-before (on-table b2) (on b1 b6))
)
)