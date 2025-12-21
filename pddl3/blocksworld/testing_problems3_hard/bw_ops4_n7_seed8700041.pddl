(define (problem BW-rand-7)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 b7 )
(:init
(arm-empty)
(on b1 b4)
(on-table b2)
(on-table b3)
(on b4 b5)
(on b5 b7)
(on b6 b3)
(on b7 b6)
(clear b1)
(clear b2)
)
(:goal
(and
(on b3 b4)
(on b5 b6)
(on b6 b1)
(on b7 b5))
)

(:constraints
  (sometime-before (on b5 b6) (on b3 b4))
)
)