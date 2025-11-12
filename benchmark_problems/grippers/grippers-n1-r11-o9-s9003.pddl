(define (problem gripper-1-11-9)
(:domain gripper-strips)
(:objects robot1 - robot
rgripper1 lgripper1 - gripper
room1 room2 room3 room4 room5 room6 room7 room8 room9 room10 room11 - room
ball1 ball2 ball3 ball4 ball5 ball6 ball7 ball8 ball9 - object)
(:init
(at-robby robot1 room11)
(free robot1 rgripper1)
(free robot1 lgripper1)
(at ball1 room5)
(at ball2 room3)
(at ball3 room5)
(at ball4 room6)
(at ball5 room1)
(at ball6 room3)
(at ball7 room7)
(at ball8 room4)
(at ball9 room4)
)
(:goal
(and
(at ball1 room3)
(at ball2 room2)
(at ball3 room1)
(at ball4 room8)
(at ball5 room6)
(at ball6 room8)
(at ball7 room8)
(at ball8 room10)
(at ball9 room7)
)
)
)
