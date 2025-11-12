(define (problem gripper-1-11-9)
(:domain gripper-strips)
(:objects robot1 - robot
rgripper1 lgripper1 - gripper
room1 room2 room3 room4 room5 room6 room7 room8 room9 room10 room11 - room
ball1 ball2 ball3 ball4 ball5 ball6 ball7 ball8 ball9 - object)
(:init
(at-robby robot1 room7)
(free robot1 rgripper1)
(free robot1 lgripper1)
(at ball1 room10)
(at ball2 room1)
(at ball3 room4)
(at ball4 room2)
(at ball5 room5)
(at ball6 room5)
(at ball7 room4)
(at ball8 room8)
(at ball9 room4)
)
(:goal
(and
(at ball1 room4)
(at ball2 room7)
(at ball3 room11)
(at ball4 room6)
(at ball5 room11)
(at ball6 room11)
(at ball7 room3)
(at ball8 room11)
(at ball9 room9)
)
)
)
