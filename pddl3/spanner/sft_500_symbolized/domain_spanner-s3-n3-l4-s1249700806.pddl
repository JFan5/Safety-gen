(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_5 type_2 - object
	type_4 type_1 type_3 - type_2	
)                                           
                                                                               
(:predicates 
	(pred_3 ?v1 - type_2 ?v5 - type_5)
	(pred_6 ?v1 - type_4 ?v4 - type_3)
	(pred_2 ?v4 - type_3)
	(pred_1 ?v7 - type_5 ?v6 - type_5)
	(pred_5 ?v2 - type_1)
	(pred_4 ?v2 - type_1))                                                                                           
(:action op_1 
        :parameters (?v3 - type_5 ?v8 - type_5 ?v1 - type_4)
        :precondition (and (pred_3 ?v1 ?v3) 
                           (pred_1 ?v3 ?v8))                                                          
        :effect (and (not (pred_3 ?v1 ?v3)) (pred_3 ?v1 ?v8)))

(:action op_3 
        :parameters (?v5 - type_5 ?v4 - type_3 ?v1 - type_4)
        :precondition (and (pred_3 ?v1 ?v5) 
                           (pred_3 ?v4 ?v5))
        :effect (and (not (pred_3 ?v4 ?v5))
                     (pred_6 ?v1 ?v4)))

(:action op_2 
        :parameters (?v5 - type_5 ?v4 - type_3 ?v1 - type_4 ?v2 - type_1)
        :precondition (and (pred_3 ?v1 ?v5) 
		      	   (pred_3 ?v2 ?v5)
			   (pred_6 ?v1 ?v4)
			   (pred_2 ?v4)
			   (pred_4 ?v2))
        :effect (and (not (pred_4 ?v2))(not (pred_2 ?v4)) (pred_5 ?v2)))
)