(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_4 type_1 - object
	type_5 type_3 type_2 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_3 ?v3 - type_1 ?v5 - type_4)
	(pred_1 ?v3 - type_5 ?v4 - type_2)
	(pred_5 ?v4 - type_2)
	(pred_2 ?v1 - type_4 ?v6 - type_4)
	(pred_6 ?v7 - type_3)
	(pred_4 ?v7 - type_3))                                                                                           
(:action op_3 
        :parameters (?v2 - type_4 ?v8 - type_4 ?v3 - type_5)
        :precondition (and (pred_3 ?v3 ?v2) 
                           (pred_2 ?v2 ?v8))                                                          
        :effect (and (not (pred_3 ?v3 ?v2)) (pred_3 ?v3 ?v8)))

(:action op_1 
        :parameters (?v5 - type_4 ?v4 - type_2 ?v3 - type_5)
        :precondition (and (pred_3 ?v3 ?v5) 
                           (pred_3 ?v4 ?v5))
        :effect (and (not (pred_3 ?v4 ?v5))
                     (pred_1 ?v3 ?v4)))

(:action op_2 
        :parameters (?v5 - type_4 ?v4 - type_2 ?v3 - type_5 ?v7 - type_3)
        :precondition (and (pred_3 ?v3 ?v5) 
		      	   (pred_3 ?v7 ?v5)
			   (pred_1 ?v3 ?v4)
			   (pred_5 ?v4)
			   (pred_4 ?v7))
        :effect (and (not (pred_4 ?v7))(not (pred_5 ?v4)) (pred_6 ?v7)))
)