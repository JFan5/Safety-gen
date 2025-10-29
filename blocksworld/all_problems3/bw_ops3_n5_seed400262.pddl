(define (problem BW-rand-5)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 )
(:init
(arm-empty)
(on b1 b3)
(on-table b2)
(on b3 b2)
(on b4 b1)
(on-table b5)
(clear b4)
(clear b5)
)
(:goal
(and
(on b1 b3)
(on b2 b4)
(on-table b3)
(on b4 b5)
(on b5 b1))
)

(:constraints
  (sometime-before (on b2 b4) (on b1 b3))
)
)