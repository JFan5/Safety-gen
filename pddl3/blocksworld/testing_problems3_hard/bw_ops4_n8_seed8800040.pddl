(define (problem BW-rand-8)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 b7 b8 )
(:init
(arm-empty)
(on b1 b6)
(on b2 b7)
(on b3 b5)
(on b4 b3)
(on b5 b1)
(on b6 b2)
(on-table b7)
(on-table b8)
(clear b4)
(clear b8)
)
(:goal
(and
(on b3 b1)
(on b5 b7)
(on b6 b3)
(on b7 b4)
(on b8 b6))
)

(:constraints
  (sometime-before (on b5 b7) (on b3 b1))
)
)