(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_2 type_4 - object
	type_5 type_1 type_3 - type_4	
)                                           
                                                                               
(:predicates 
	(pred_4 ?v7 - type_4 ?v1 - type_2)
	(pred_6 ?v7 - type_5 ?v2 - type_3)
	(pred_3 ?v2 - type_3)
	(pred_1 ?v4 - type_2 ?v6 - type_2)
	(pred_5 ?v5 - type_1)
	(pred_2 ?v5 - type_1))                                                                                           
(:action op_1 
        :parameters (?v3 - type_2 ?v8 - type_2 ?v7 - type_5)
        :precondition (and (pred_4 ?v7 ?v3) 
                           (pred_1 ?v3 ?v8))                                                          
        :effect (and (not (pred_4 ?v7 ?v3)) (pred_4 ?v7 ?v8)))

(:action op_3 
        :parameters (?v1 - type_2 ?v2 - type_3 ?v7 - type_5)
        :precondition (and (pred_4 ?v7 ?v1) 
                           (pred_4 ?v2 ?v1))
        :effect (and (not (pred_4 ?v2 ?v1))
                     (pred_6 ?v7 ?v2)))

(:action op_2 
        :parameters (?v1 - type_2 ?v2 - type_3 ?v7 - type_5 ?v5 - type_1)
        :precondition (and (pred_4 ?v7 ?v1) 
		      	   (pred_4 ?v5 ?v1)
			   (pred_6 ?v7 ?v2)
			   (pred_3 ?v2)
			   (pred_2 ?v5))
        :effect (and (not (pred_2 ?v5))(not (pred_3 ?v2)) (pred_5 ?v5)))
)