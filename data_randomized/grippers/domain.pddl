(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types room object robot gripper)
 (:predicates (p4 ?r - robot ?x - room)
 	      (p2 ?o - object ?x - room)
	      (p3 ?r - robot ?g - gripper)
	      (p1 ?r - robot ?o - object ?g - gripper))

   (:action a3
       :parameters  (?r - robot ?from ?to - room)
       :precondition (and  (p4 ?r ?from))
       :effect (and  (p4 ?r ?to)
		     (not (p4 ?r ?from))))

   (:action a1
       :parameters (?r - robot ?obj - object ?room - room ?g - gripper)
       :precondition  (and  (p2 ?obj ?room) (p4 ?r ?room) (p3 ?r ?g))
       :effect (and (p1 ?r ?obj ?g)
		    (not (p2 ?obj ?room)) 
		    (not (p3 ?r ?g))))

   (:action a2
       :parameters (?r - robot ?obj - object ?room - room ?g - gripper)
       :precondition  (and  (p1 ?r ?obj ?g) (p4 ?r ?room))
       :effect (and (p2 ?obj ?room)
		    (p3 ?r ?g)
		    (not (p1 ?r ?obj ?g)))))