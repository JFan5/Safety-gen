(define (problem BW-rand-6)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 )
(:init
(arm-empty)
(on b1 b3)
(on b2 b4)
(on b3 b6)
(on-table b4)
(on b5 b2)
(on b6 b5)
(clear b1)
)
(:goal
(and
(on-table b1)
(on b2 b5)
(on b3 b2)
(on-table b4)
(on b5 b6)
(on-table b6))
)

(:constraints
  (sometime-before (on b2 b5) (on-table b1))
)
)