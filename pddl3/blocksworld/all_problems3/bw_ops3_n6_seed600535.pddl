(define (problem BW-rand-6)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 )
(:init
(arm-empty)
(on b1 b3)
(on b2 b5)
(on-table b3)
(on b4 b6)
(on b5 b4)
(on b6 b1)
(clear b2)
)
(:goal
(and
(on b1 b4)
(on b2 b3)
(on-table b3)
(on b4 b6)
(on b5 b2)
(on b6 b5))
)

(:constraints
  (sometime-before (on b2 b3) (on b1 b4))
)
)