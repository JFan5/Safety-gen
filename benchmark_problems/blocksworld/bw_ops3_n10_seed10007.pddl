

(define (problem BW-rand-10)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 )
(:init
(arm-empty)
(on b1 b5)
(on b2 b1)
(on b3 b6)
(on-table b4)
(on b5 b8)
(on b6 b7)
(on b7 b10)
(on b8 b4)
(on b9 b3)
(on-table b10)
(clear b2)
(clear b9)
)
(:goal
(and
(on-table b1)
(on b2 b1)
(on-table b3)
(on-table b4)
(on-table b5)
(on b6 b5)
(on b7 b9)
(on b8 b6)
(on-table b9)
(on b10 b2))
)
)


