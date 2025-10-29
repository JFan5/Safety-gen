(define (problem BW-rand-6)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 )
(:init
(arm-empty)
(on b1 b6)
(on-table b2)
(on b3 b1)
(on-table b4)
(on b5 b3)
(on b6 b2)
(clear b4)
(clear b5)
)
(:goal
(and
(on b1 b5)
(on b2 b3)
(on b3 b4)
(on b4 b6)
(on b6 b1))
)

(:constraints
  (sometime-before (on b2 b3) (on b1 b5))
)
)