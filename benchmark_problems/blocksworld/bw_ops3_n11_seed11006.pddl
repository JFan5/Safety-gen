

(define (problem BW-rand-11)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 b11 )
(:init
(arm-empty)
(on b1 b4)
(on b2 b11)
(on b3 b8)
(on b4 b5)
(on-table b5)
(on b6 b3)
(on b7 b9)
(on b8 b1)
(on b9 b10)
(on b10 b2)
(on-table b11)
(clear b6)
(clear b7)
)
(:goal
(and
(on-table b1)
(on-table b2)
(on b3 b5)
(on b4 b10)
(on-table b5)
(on-table b6)
(on b7 b9)
(on b8 b6)
(on b9 b2)
(on b10 b11)
(on b11 b3))
)
)


