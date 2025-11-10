

(define (problem BW-rand-8)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 b7 b8 )
(:init
(arm-empty)
(on-table b1)
(on b2 b6)
(on b3 b5)
(on-table b4)
(on b5 b1)
(on b6 b7)
(on-table b7)
(on b8 b2)
(clear b3)
(clear b4)
(clear b8)
)
(:goal
(and
(on-table b1)
(on b2 b4)
(on b3 b7)
(on-table b4)
(on b5 b1)
(on b6 b3)
(on b7 b5)
(on b8 b2))
)
)


