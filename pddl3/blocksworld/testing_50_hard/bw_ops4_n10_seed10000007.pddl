

(define (problem BW-rand-10)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 )
(:init
(arm-empty)
(on-table b1)
(on b2 b7)
(on b3 b4)
(on b4 b2)
(on b5 b3)
(on b6 b9)
(on-table b7)
(on b8 b6)
(on b9 b10)
(on b10 b1)
(clear b5)
(clear b8)
)
(:goal
(and
(on b1 b8)
(on b2 b9)
(on b5 b4)
(on b6 b10)
(on b7 b3)
(on b8 b2)
(on b9 b7)
(on b10 b5))
)
)


