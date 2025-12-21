(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_2 type_4 - object
	type_5 type_3 type_1 - type_4	
)                                           
                                                                               
(:predicates 
	(pred_2 ?v4 - type_4 ?v6 - type_2)
	(pred_6 ?v4 - type_5 ?v8 - type_1)
	(pred_4 ?v8 - type_1)
	(pred_5 ?v3 - type_2 ?v7 - type_2)
	(pred_1 ?v2 - type_3)
	(pred_3 ?v2 - type_3))                                                                                           
(:action op_3 
        :parameters (?v5 - type_2 ?v1 - type_2 ?v4 - type_5)
        :precondition (and (pred_2 ?v4 ?v5) 
                           (pred_5 ?v5 ?v1))                                                          
        :effect (and (not (pred_2 ?v4 ?v5)) (pred_2 ?v4 ?v1)))

(:action op_2 
        :parameters (?v6 - type_2 ?v8 - type_1 ?v4 - type_5)
        :precondition (and (pred_2 ?v4 ?v6) 
                           (pred_2 ?v8 ?v6))
        :effect (and (not (pred_2 ?v8 ?v6))
                     (pred_6 ?v4 ?v8)))

(:action op_1 
        :parameters (?v6 - type_2 ?v8 - type_1 ?v4 - type_5 ?v2 - type_3)
        :precondition (and (pred_2 ?v4 ?v6) 
		      	   (pred_2 ?v2 ?v6)
			   (pred_6 ?v4 ?v8)
			   (pred_4 ?v8)
			   (pred_3 ?v2))
        :effect (and (not (pred_3 ?v2))(not (pred_4 ?v8)) (pred_1 ?v2)))
)