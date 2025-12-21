(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_1 - object
	type_4 type_5 type_2 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_5 ?v7 - type_1 ?v3 - type_3)
	(pred_2 ?v7 - type_4 ?v4 - type_2)
	(pred_1 ?v4 - type_2)
	(pred_6 ?v6 - type_3 ?v5 - type_3)
	(pred_4 ?v1 - type_5)
	(pred_3 ?v1 - type_5))                                                                                           
(:action op_3 
        :parameters (?v2 - type_3 ?v8 - type_3 ?v7 - type_4)
        :precondition (and (pred_5 ?v7 ?v2) 
                           (pred_6 ?v2 ?v8))                                                          
        :effect (and (not (pred_5 ?v7 ?v2)) (pred_5 ?v7 ?v8)))

(:action op_2 
        :parameters (?v3 - type_3 ?v4 - type_2 ?v7 - type_4)
        :precondition (and (pred_5 ?v7 ?v3) 
                           (pred_5 ?v4 ?v3))
        :effect (and (not (pred_5 ?v4 ?v3))
                     (pred_2 ?v7 ?v4)))

(:action op_1 
        :parameters (?v3 - type_3 ?v4 - type_2 ?v7 - type_4 ?v1 - type_5)
        :precondition (and (pred_5 ?v7 ?v3) 
		      	   (pred_5 ?v1 ?v3)
			   (pred_2 ?v7 ?v4)
			   (pred_1 ?v4)
			   (pred_3 ?v1))
        :effect (and (not (pred_3 ?v1))(not (pred_1 ?v4)) (pred_4 ?v1)))
)