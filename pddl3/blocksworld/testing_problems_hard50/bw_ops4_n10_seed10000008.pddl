

(define (problem BW-rand-10)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 )
(:init
(arm-empty)
(on-table b1)
(on b2 b7)
(on b3 b6)
(on b4 b10)
(on-table b5)
(on b6 b9)
(on b7 b8)
(on b8 b3)
(on-table b9)
(on-table b10)
(clear b1)
(clear b2)
(clear b4)
(clear b5)
)
(:goal
(and
(on b1 b3)
(on b2 b10)
(on b3 b2)
(on b5 b9)
(on b6 b8)
(on b7 b1)
(on b8 b7)
(on b10 b4))
)
)


