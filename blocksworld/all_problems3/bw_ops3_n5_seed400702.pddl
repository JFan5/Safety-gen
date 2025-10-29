(define (problem BW-rand-5)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 )
(:init
(arm-empty)
(on b1 b5)
(on b2 b3)
(on b3 b4)
(on b4 b1)
(on-table b5)
(clear b2)
)
(:goal
(and
(on-table b1)
(on-table b2)
(on b3 b2)
(on b4 b5)
(on b5 b1))
)

(:constraints
  (sometime-before (on-table b2) (on-table b1))
)
)