

(define (problem BW-rand-7)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 b7 )
(:init
(arm-empty)
(on b1 b4)
(on b2 b6)
(on b3 b7)
(on b4 b2)
(on b5 b1)
(on-table b6)
(on b7 b5)
(clear b3)
)
(:goal
(and
(on b1 b2)
(on b2 b4)
(on b3 b6)
(on b4 b7)
(on b5 b3))
)
)


