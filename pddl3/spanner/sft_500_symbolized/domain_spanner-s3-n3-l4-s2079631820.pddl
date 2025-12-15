(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_2 type_4 - object
	type_1 type_3 type_5 - type_4	
)                                           
                                                                               
(:predicates 
	(pred_4 ?v5 - type_4 ?v2 - type_2)
	(pred_3 ?v5 - type_1 ?v8 - type_5)
	(pred_1 ?v8 - type_5)
	(pred_6 ?v7 - type_2 ?v6 - type_2)
	(pred_2 ?v4 - type_3)
	(pred_5 ?v4 - type_3))                                                                                           
(:action op_1 
        :parameters (?v3 - type_2 ?v1 - type_2 ?v5 - type_1)
        :precondition (and (pred_4 ?v5 ?v3) 
                           (pred_6 ?v3 ?v1))                                                          
        :effect (and (not (pred_4 ?v5 ?v3)) (pred_4 ?v5 ?v1)))

(:action op_2 
        :parameters (?v2 - type_2 ?v8 - type_5 ?v5 - type_1)
        :precondition (and (pred_4 ?v5 ?v2) 
                           (pred_4 ?v8 ?v2))
        :effect (and (not (pred_4 ?v8 ?v2))
                     (pred_3 ?v5 ?v8)))

(:action op_3 
        :parameters (?v2 - type_2 ?v8 - type_5 ?v5 - type_1 ?v4 - type_3)
        :precondition (and (pred_4 ?v5 ?v2) 
		      	   (pred_4 ?v4 ?v2)
			   (pred_3 ?v5 ?v8)
			   (pred_1 ?v8)
			   (pred_5 ?v4))
        :effect (and (not (pred_5 ?v4))(not (pred_1 ?v8)) (pred_2 ?v4)))
)