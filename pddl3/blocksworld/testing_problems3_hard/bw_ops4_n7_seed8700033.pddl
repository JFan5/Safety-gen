(define (problem BW-rand-7)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 b7 )
(:init
(arm-empty)
(on b1 b5)
(on b2 b7)
(on b3 b4)
(on-table b4)
(on b5 b3)
(on-table b6)
(on b7 b6)
(clear b1)
(clear b2)
)
(:goal
(and
(on b1 b4)
(on b2 b3)
(on b3 b7)
(on b5 b6)
(on b6 b1)
(on b7 b5))
)

(:constraints
  (sometime-before (on b2 b3) (on b1 b4))
)
)