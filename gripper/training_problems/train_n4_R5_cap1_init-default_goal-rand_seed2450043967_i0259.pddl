


(define (problem gripper-4)
(:domain gripper-strips)
(:objects rooma roomb room3 room4 room5 left ball1 ball2 ball3 ball4 )
(:init
(room rooma)
(room roomb)
(room room3)
(room room4)
(room room5)
(gripper left)
(ball ball1)
(ball ball2)
(ball ball3)
(ball ball4)
(free left)
(at ball1 rooma)
(at ball2 rooma)
(at ball3 rooma)
(at ball4 rooma)
(at-robby rooma)
)
(:goal
(and
(at ball1 rooma)
(at ball2 rooma)
(at ball3 roomb)
(at ball4 room5)
)
)
)


