


(define (problem gripper-4)
(:domain gripper-strips)
(:objects rooma roomb room3 room4 room5 left right ball1 ball2 ball3 ball4 )
(:init
(room rooma)
(room roomb)
(room room3)
(room room4)
(room room5)
(gripper left)
(gripper right)
(ball ball1)
(ball ball2)
(ball ball3)
(ball ball4)
(free left)
(free right)
(at ball1 rooma)
(at ball2 roomb)
(at ball3 room3)
(at ball4 room4)
(at-robby rooma)
)
(:goal
(and
(at ball1 room3)
(at ball2 room3)
(at ball3 room3)
(at ball4 room3)
)
)
)


