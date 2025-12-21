(define (problem BW-rand-7)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 b7 )
(:init
(arm-empty)
(on-table b1)
(on b2 b1)
(on-table b3)
(on b4 b7)
(on b5 b2)
(on b6 b3)
(on b7 b5)
(clear b4)
(clear b6)
)
(:goal
(and
(on b1 b4)
(on b2 b6)
(on b3 b2)
(on b4 b3)
(on b7 b1))
)

(:constraints
  (sometime-before (on b2 b6) (on b1 b4))
)
)