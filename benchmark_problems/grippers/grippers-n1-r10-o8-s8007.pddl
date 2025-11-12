(define (problem gripper-1-10-8)
(:domain gripper-strips)
(:objects robot1 - robot
rgripper1 lgripper1 - gripper
room1 room2 room3 room4 room5 room6 room7 room8 room9 room10 - room
ball1 ball2 ball3 ball4 ball5 ball6 ball7 ball8 - object)
(:init
(at-robby robot1 room1)
(free robot1 rgripper1)
(free robot1 lgripper1)
(at ball1 room10)
(at ball2 room8)
(at ball3 room1)
(at ball4 room3)
(at ball5 room7)
(at ball6 room2)
(at ball7 room8)
(at ball8 room1)
)
(:goal
(and
(at ball1 room10)
(at ball2 room8)
(at ball3 room9)
(at ball4 room9)
(at ball5 room6)
(at ball6 room9)
(at ball7 room9)
(at ball8 room8)
)
)
)
