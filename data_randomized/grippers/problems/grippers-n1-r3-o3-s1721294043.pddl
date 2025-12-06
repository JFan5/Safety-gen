(define (problem gripper-1-3-3)
(:domain gripper-strips)
(:objects o3 - robot
o7 o8 - gripper
o10 o1 o6 - room
o5 o2 o9 - object)
(:init
(p4 o3 o10)
(p3 o3 o7)
(p3 o3 o8)
(p2 o5 o6)
(p2 o2 o1)
(p2 o9 o1)
)
(:goal
(and
(p2 o5 o10)
(p2 o2 o10)
(p2 o9 o10)
)
)

(:constraints
  (always (forall (?b - object)
           (not (p1 o3 ?b o8))))
)
)