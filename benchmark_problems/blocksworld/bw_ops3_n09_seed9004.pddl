

(define (problem BW-rand-9)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 b7 b8 b9 )
(:init
(arm-empty)
(on b1 b5)
(on b2 b1)
(on-table b3)
(on b4 b8)
(on-table b5)
(on b6 b9)
(on-table b7)
(on b8 b6)
(on b9 b7)
(clear b2)
(clear b3)
(clear b4)
)
(:goal
(and
(on b1 b6)
(on-table b2)
(on-table b3)
(on b4 b2)
(on b5 b9)
(on b6 b8)
(on b7 b4)
(on b8 b3)
(on b9 b7))
)
)


