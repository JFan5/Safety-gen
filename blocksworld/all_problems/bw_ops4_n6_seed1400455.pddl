

(define (problem BW-rand-6)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 )
(:init
(arm-empty)
(on b1 b5)
(on-table b2)
(on b3 b6)
(on b4 b3)
(on b5 b4)
(on b6 b2)
(clear b1)
)
(:goal
(and
(on b1 b6)
(on b2 b4)
(on b3 b5)
(on b6 b2))
)
)


