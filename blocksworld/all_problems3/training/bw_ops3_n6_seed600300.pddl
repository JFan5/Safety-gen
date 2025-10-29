(define (problem BW-rand-6)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 )
(:init
(arm-empty)
(on-table b1)
(on b2 b6)
(on-table b3)
(on b4 b3)
(on-table b5)
(on b6 b4)
(clear b1)
(clear b2)
(clear b5)
)
(:goal
(and
(on-table b1)
(on b2 b5)
(on-table b3)
(on b4 b6)
(on b5 b1)
(on b6 b2))
)

(:constraints
  (sometime-before (on b2 b5) (on-table b1))
)
)