(define (problem gripper-1-11-9)
(:domain gripper-strips)
(:objects robot1 - robot
rgripper1 lgripper1 - gripper
room1 room2 room3 room4 room5 room6 room7 room8 room9 room10 room11 - room
ball1 ball2 ball3 ball4 ball5 ball6 ball7 ball8 ball9 - object)
(:init
(at-robby robot1 room6)
(free robot1 rgripper1)
(free robot1 lgripper1)
(at ball1 room7)
(at ball2 room7)
(at ball3 room5)
(at ball4 room4)
(at ball5 room3)
(at ball6 room4)
(at ball7 room6)
(at ball8 room3)
(at ball9 room6)
)
(:goal
(and
(at ball1 room9)
(at ball2 room7)
(at ball3 room8)
(at ball4 room9)
(at ball5 room6)
(at ball6 room1)
(at ball7 room2)
(at ball8 room2)
(at ball9 room2)
)
)
)
