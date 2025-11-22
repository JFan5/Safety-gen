


(define (problem gripper-5)
(:domain gripper-strips)
(:objects rooma roomb room3 room4 room5 left ball1 ball2 ball3 ball4 ball5 )
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
(ball ball5)
(free left)
(at ball1 rooma)
(at ball2 rooma)
(at ball3 roomb)
(at ball4 roomb)
(at ball5 room4)
(at-robby rooma)
)
(:goal
(and
(at ball1 rooma)
(at ball2 room4)
(at ball3 room4)
(at ball4 room4)
(at ball5 room5)
)
)
)


