

(define (problem BW-rand-6)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 )
(:init
(arm-empty)
(on-table b1)
(on b2 b3)
(on b3 b1)
(on b4 b6)
(on b5 b2)
(on b6 b5)
(clear b4)
)
(:goal
(and
(on b5 b4)
(on b6 b3))
)
)


