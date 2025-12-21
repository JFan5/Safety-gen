

(define (problem BW-rand-9)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 b7 b8 b9 )
(:init
(arm-empty)
(on b1 b6)
(on b2 b9)
(on-table b3)
(on b4 b8)
(on b5 b2)
(on b6 b5)
(on b7 b4)
(on-table b8)
(on b9 b7)
(clear b1)
(clear b3)
)
(:goal
(and
(on b2 b6)
(on b3 b5)
(on b4 b2)
(on b6 b3)
(on b7 b9)
(on b8 b7)
(on b9 b1))
)
)


