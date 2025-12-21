

(define (problem BW-rand-9)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 b7 b8 b9 )
(:init
(arm-empty)
(on-table b1)
(on b2 b6)
(on-table b3)
(on b4 b8)
(on b5 b9)
(on b6 b7)
(on b7 b1)
(on-table b8)
(on b9 b4)
(clear b2)
(clear b3)
(clear b5)
)
(:goal
(and
(on b2 b7)
(on b4 b3)
(on b5 b4)
(on b7 b8)
(on b9 b5))
)
)


