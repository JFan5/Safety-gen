

(define (problem BW-rand-7)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 b7 )
(:init
(arm-empty)
(on b1 b5)
(on b2 b6)
(on b3 b2)
(on b4 b3)
(on b5 b4)
(on b6 b7)
(on-table b7)
(clear b1)
)
(:goal
(and
(on b1 b4)
(on b2 b3)
(on b3 b1)
(on-table b4)
(on-table b5)
(on b6 b7)
(on-table b7))
)
)


