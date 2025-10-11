


(define (problem gripper-6)
(:domain gripper-strips)
(:objects rooma roomb room3 room4 room5 room6 left right ball1 ball2 ball3 ball4 ball5 ball6 )
(:init
(room rooma)
(room roomb)
(room room3)
(room room4)
(room room5)
(room room6)
(gripper left)
(gripper right)
(ball ball1)
(ball ball2)
(ball ball3)
(ball ball4)
(ball ball5)
(ball ball6)
(free left)
(free right)
(at ball1 rooma)
(at ball2 room3)
(at ball3 room5)
(at ball4 room5)
(at ball5 room6)
(at ball6 room6)
(at-robby rooma)
)
(:goal
(and
(at ball1 room6)
(at ball2 room6)
(at ball3 room6)
(at ball4 room6)
(at ball5 room6)
(at ball6 room6)
)
)
)


