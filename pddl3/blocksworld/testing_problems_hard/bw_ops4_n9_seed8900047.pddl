

(define (problem BW-rand-9)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 b7 b8 b9 )
(:init
(arm-empty)
(on b1 b8)
(on-table b2)
(on b3 b6)
(on-table b4)
(on b5 b1)
(on b6 b5)
(on-table b7)
(on b8 b7)
(on b9 b4)
(clear b2)
(clear b3)
(clear b9)
)
(:goal
(and
(on b1 b3)
(on b3 b2)
(on b5 b4)
(on b6 b9)
(on b8 b1)
(on b9 b8))
)
)


