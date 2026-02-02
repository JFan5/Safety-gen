

(define (problem BW-rand-10)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 )
(:init
(arm-empty)
(on-table b1)
(on-table b2)
(on-table b3)
(on b4 b2)
(on b5 b4)
(on b6 b1)
(on-table b7)
(on b8 b7)
(on b9 b3)
(on b10 b8)
(clear b5)
(clear b6)
(clear b9)
(clear b10)
)
(:goal
(and
(on b1 b5)
(on b3 b1)
(on b4 b10)
(on b5 b8)
(on b6 b2)
(on b7 b9)
(on b8 b7))
)
)


