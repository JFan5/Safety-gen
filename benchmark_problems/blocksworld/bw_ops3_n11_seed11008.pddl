

(define (problem BW-rand-11)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 b11 )
(:init
(arm-empty)
(on b1 b11)
(on b2 b5)
(on b3 b6)
(on b4 b1)
(on-table b5)
(on-table b6)
(on b7 b2)
(on-table b8)
(on b9 b7)
(on b10 b8)
(on b11 b10)
(clear b3)
(clear b4)
(clear b9)
)
(:goal
(and
(on b1 b2)
(on b2 b7)
(on b3 b6)
(on-table b4)
(on b5 b8)
(on b6 b10)
(on b7 b11)
(on-table b8)
(on-table b9)
(on b10 b1)
(on b11 b9))
)
)


