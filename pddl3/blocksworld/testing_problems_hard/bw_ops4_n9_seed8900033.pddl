

(define (problem BW-rand-9)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 b7 b8 b9 )
(:init
(arm-empty)
(on-table b1)
(on b2 b7)
(on b3 b1)
(on-table b4)
(on b5 b9)
(on b6 b8)
(on b7 b6)
(on-table b8)
(on b9 b2)
(clear b3)
(clear b4)
(clear b5)
)
(:goal
(and
(on b2 b5)
(on b3 b7)
(on b4 b9)
(on b5 b1)
(on b6 b8)
(on b8 b4))
)
)


