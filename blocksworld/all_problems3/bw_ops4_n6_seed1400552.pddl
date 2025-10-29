(define (problem BW-rand-6)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 )
(:init
(arm-empty)
(on b1 b3)
(on-table b2)
(on b3 b2)
(on b4 b5)
(on b5 b6)
(on-table b6)
(clear b1)
(clear b4)
)
(:goal
(and
(on b2 b4)
(on b3 b5)
(on b5 b1)
(on b6 b3))
)

(:constraints
  (sometime-before (on b3 b5) (on b2 b4))
)
)