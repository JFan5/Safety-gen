(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (p7 ?x ?y)
		(p4 ?c)
		(p2 ?l)
		(p1 ?l)
		(p3 ?c ?l)
		(p5)
		(p6 ?c))

   (:action a3
       :parameters  (?from ?to)
       :precondition (and (p7 ?from ?to) 
                          (p2 ?from) (p2 ?to) (p1 ?from))
       :effect (and  (p1 ?to)
		     (not (p1 ?from))))


   (:action a2
       :parameters (?p4 ?loc)
       :precondition  (and  (p4 ?p4) (p2 ?loc)
			    (p3 ?p4 ?loc) (p1 ?loc) (p5))
       :effect (and (p6 ?p4)
		    (not (p3 ?p4 ?loc)) 
		    (not (p5))))

   (:action a1
       :parameters  (?p4  ?loc)
       :precondition  (and  (p4 ?p4) (p2 ?loc)
			    (p6 ?p4) (p1 ?loc))
       :effect (and (p3 ?p4 ?loc)
		    (p5)
		    (not (p6 ?p4)))))
