

(define (problem BW-rand-10)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 )
(:init
(arm-empty)
(on-table b1)
(on b2 b3)
(on b3 b4)
(on-table b4)
(on b5 b9)
(on b6 b7)
(on b7 b10)
(on-table b8)
(on b9 b8)
(on-table b10)
(clear b1)
(clear b2)
(clear b5)
(clear b6)
)
(:goal
(and
(on b1 b5)
(on-table b2)
(on b3 b10)
(on b4 b1)
(on b5 b3)
(on-table b6)
(on b7 b6)
(on b8 b4)
(on b9 b2)
(on-table b10))
)
)


