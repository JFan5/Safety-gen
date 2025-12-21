

(define (problem BW-rand-8)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 b7 b8 )
(:init
(arm-empty)
(on-table b1)
(on-table b2)
(on b3 b7)
(on b4 b3)
(on b5 b8)
(on-table b6)
(on b7 b2)
(on b8 b4)
(clear b1)
(clear b5)
(clear b6)
)
(:goal
(and
(on b3 b1)
(on b5 b4)
(on b7 b5))
)
)


