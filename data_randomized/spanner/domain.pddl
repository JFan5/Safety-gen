(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	location locatable - object
	man nut spanner - locatable	
)                                           
                                                                               
(:predicates 
	(p4 ?m - locatable ?l - location)
	(p2 ?m - man ?s - spanner)
	(p5 ?s - spanner)
	(p3 ?l1 - location ?l2 - location)
	(p6 ?n - nut)
	(p1 ?n - nut))                                                                                           
(:action a3 
        :parameters (?start - location ?end - location ?m - man)
        :precondition (and (p4 ?m ?start) 
                           (p3 ?start ?end))                                                          
        :effect (and (not (p4 ?m ?start)) (p4 ?m ?end)))

(:action a1 
        :parameters (?l - location ?s - spanner ?m - man)
        :precondition (and (p4 ?m ?l) 
                           (p4 ?s ?l))
        :effect (and (not (p4 ?s ?l))
                     (p2 ?m ?s)))

(:action a2 
        :parameters (?l - location ?s - spanner ?m - man ?n - nut)
        :precondition (and (p4 ?m ?l) 
		      	   (p4 ?n ?l)
			   (p2 ?m ?s)
			   (p5 ?s)
			   (p1 ?n))
        :effect (and (not (p1 ?n))(not (p5 ?s)) (p6 ?n)))
)