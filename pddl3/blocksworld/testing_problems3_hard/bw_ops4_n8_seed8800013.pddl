(define (problem BW-rand-8)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 b7 b8 )
(:init
(arm-empty)
(on-table b1)
(on-table b2)
(on b3 b2)
(on-table b4)
(on b5 b4)
(on b6 b3)
(on b7 b6)
(on b8 b5)
(clear b1)
(clear b7)
(clear b8)
)
(:goal
(and
(on b2 b5)
(on b4 b8)
(on b5 b4)
(on b7 b6))
)

(:constraints
  (sometime-before (on b4 b8) (on b2 b5))
)
)