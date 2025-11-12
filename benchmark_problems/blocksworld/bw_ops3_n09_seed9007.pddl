

(define (problem BW-rand-9)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 b7 b8 b9 )
(:init
(arm-empty)
(on b1 b8)
(on b2 b6)
(on b3 b1)
(on-table b4)
(on-table b5)
(on b6 b4)
(on-table b7)
(on b8 b7)
(on b9 b3)
(clear b2)
(clear b5)
(clear b9)
)
(:goal
(and
(on-table b1)
(on b2 b6)
(on b3 b9)
(on-table b4)
(on b5 b8)
(on b6 b4)
(on b7 b1)
(on-table b8)
(on b9 b5))
)
)


