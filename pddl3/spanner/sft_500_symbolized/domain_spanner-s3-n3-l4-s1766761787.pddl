(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_4 - object
	type_5 type_2 type_1 - type_4	
)                                           
                                                                               
(:predicates 
	(pred_3 ?v8 - type_4 ?v1 - type_3)
	(pred_2 ?v8 - type_5 ?v3 - type_1)
	(pred_4 ?v3 - type_1)
	(pred_5 ?v7 - type_3 ?v6 - type_3)
	(pred_6 ?v5 - type_2)
	(pred_1 ?v5 - type_2))                                                                                           
(:action op_3 
        :parameters (?v2 - type_3 ?v4 - type_3 ?v8 - type_5)
        :precondition (and (pred_3 ?v8 ?v2) 
                           (pred_5 ?v2 ?v4))                                                          
        :effect (and (not (pred_3 ?v8 ?v2)) (pred_3 ?v8 ?v4)))

(:action op_1 
        :parameters (?v1 - type_3 ?v3 - type_1 ?v8 - type_5)
        :precondition (and (pred_3 ?v8 ?v1) 
                           (pred_3 ?v3 ?v1))
        :effect (and (not (pred_3 ?v3 ?v1))
                     (pred_2 ?v8 ?v3)))

(:action op_2 
        :parameters (?v1 - type_3 ?v3 - type_1 ?v8 - type_5 ?v5 - type_2)
        :precondition (and (pred_3 ?v8 ?v1) 
		      	   (pred_3 ?v5 ?v1)
			   (pred_2 ?v8 ?v3)
			   (pred_4 ?v3)
			   (pred_1 ?v5))
        :effect (and (not (pred_1 ?v5))(not (pred_4 ?v3)) (pred_6 ?v5)))
)