(define (problem BW-rand-6)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 )
(:init
(arm-empty)
(on b1 b5)
(on b2 b4)
(on-table b3)
(on b4 b1)
(on b5 b6)
(on b6 b3)
(clear b2)
)
(:goal
(and
(on-table b1)
(on b2 b1)
(on-table b3)
(on b4 b5)
(on b5 b6)
(on b6 b3))
)

(:constraints
  (sometime-before (on b2 b1) (on-table b1))
)
)