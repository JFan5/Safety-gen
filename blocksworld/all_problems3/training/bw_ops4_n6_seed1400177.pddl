(define (problem BW-rand-6)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 )
(:init
(arm-empty)
(on b1 b3)
(on b2 b4)
(on b3 b5)
(on b4 b1)
(on-table b5)
(on b6 b2)
(clear b6)
)
(:goal
(and
(on b1 b2)
(on b3 b1)
(on b6 b5))
)

(:constraints
  (sometime-before (on b3 b1) (on b1 b2))
)
)