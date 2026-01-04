(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_1 type_4 - object
	type_3 type_2 type_5 - type_4	
)                                           
                                                                               
(:predicates 
	(pred_6 ?v5 - type_4 ?v1 - type_1)
	(pred_3 ?v5 - type_3 ?v3 - type_5)
	(pred_5 ?v3 - type_5)
	(pred_1 ?v7 - type_1 ?v6 - type_1)
	(pred_4 ?v8 - type_2)
	(pred_2 ?v8 - type_2))                                                                                           
(:action op_3 
        :parameters (?v2 - type_1 ?v4 - type_1 ?v5 - type_3)
        :precondition (and (pred_6 ?v5 ?v2) 
                           (pred_1 ?v2 ?v4))                                                          
        :effect (and (not (pred_6 ?v5 ?v2)) (pred_6 ?v5 ?v4)))

(:action op_1 
        :parameters (?v1 - type_1 ?v3 - type_5 ?v5 - type_3)
        :precondition (and (pred_6 ?v5 ?v1) 
                           (pred_6 ?v3 ?v1))
        :effect (and (not (pred_6 ?v3 ?v1))
                     (pred_3 ?v5 ?v3)))

(:action op_2 
        :parameters (?v1 - type_1 ?v3 - type_5 ?v5 - type_3 ?v8 - type_2)
        :precondition (and (pred_6 ?v5 ?v1) 
		      	   (pred_6 ?v8 ?v1)
			   (pred_3 ?v5 ?v3)
			   (pred_5 ?v3)
			   (pred_2 ?v8))
        :effect (and (not (pred_2 ?v8))(not (pred_5 ?v3)) (pred_4 ?v8)))
)