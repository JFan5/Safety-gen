


(define (problem gripper-5)
(:domain gripper-strips)
(:objects rooma roomb room3 left right ball1 ball2 ball3 ball4 ball5 )
(:init
(room rooma)
(room roomb)
(room room3)
(gripper left)
(gripper right)
(ball ball1)
(ball ball2)
(ball ball3)
(ball ball4)
(ball ball5)
(free left)
(free right)
(at ball1 rooma)
(at ball2 rooma)
(at ball3 roomb)
(at ball4 room3)
(at ball5 room3)
(at-robby rooma)
)
(:goal
(and
(at ball1 rooma)
(at ball2 rooma)
(at ball3 roomb)
(at ball4 roomb)
(at ball5 room3)
)
)
)


