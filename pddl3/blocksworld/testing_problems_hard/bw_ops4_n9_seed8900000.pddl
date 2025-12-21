

(define (problem BW-rand-9)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 b7 b8 b9 )
(:init
(arm-empty)
(on-table b1)
(on b2 b1)
(on b3 b8)
(on b4 b7)
(on-table b5)
(on-table b6)
(on b7 b3)
(on b8 b6)
(on b9 b5)
(clear b2)
(clear b4)
(clear b9)
)
(:goal
(and
(on b1 b8)
(on b2 b7)
(on b6 b3)
(on b7 b4)
(on b8 b9)
(on b9 b6))
)
)


