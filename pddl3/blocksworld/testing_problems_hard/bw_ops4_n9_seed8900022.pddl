

(define (problem BW-rand-9)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 b7 b8 b9 )
(:init
(arm-empty)
(on b1 b6)
(on b2 b9)
(on-table b3)
(on b4 b8)
(on b5 b3)
(on-table b6)
(on b7 b5)
(on b8 b1)
(on b9 b7)
(clear b2)
(clear b4)
)
(:goal
(and
(on b1 b8)
(on b2 b6)
(on b3 b4)
(on b5 b7)
(on b6 b1)
(on b7 b3)
(on b8 b5)
(on b9 b2))
)
)


