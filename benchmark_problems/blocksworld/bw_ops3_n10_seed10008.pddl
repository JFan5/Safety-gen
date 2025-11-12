

(define (problem BW-rand-10)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 )
(:init
(arm-empty)
(on b1 b6)
(on b2 b4)
(on-table b3)
(on b4 b1)
(on-table b5)
(on b6 b9)
(on b7 b5)
(on b8 b2)
(on b9 b10)
(on-table b10)
(clear b3)
(clear b7)
(clear b8)
)
(:goal
(and
(on-table b1)
(on-table b2)
(on b3 b10)
(on b4 b3)
(on b5 b6)
(on b6 b7)
(on-table b7)
(on b8 b9)
(on-table b9)
(on b10 b1))
)
)


