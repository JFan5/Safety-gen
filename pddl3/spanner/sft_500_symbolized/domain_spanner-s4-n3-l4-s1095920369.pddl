(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_1 type_3 - object
	type_2 type_4 type_5 - type_3	
)                                           
                                                                               
(:predicates 
	(pred_2 ?v5 - type_3 ?v8 - type_1)
	(pred_6 ?v5 - type_2 ?v3 - type_5)
	(pred_1 ?v3 - type_5)
	(pred_5 ?v4 - type_1 ?v6 - type_1)
	(pred_3 ?v7 - type_4)
	(pred_4 ?v7 - type_4))                                                                                           
(:action op_3 
        :parameters (?v1 - type_1 ?v2 - type_1 ?v5 - type_2)
        :precondition (and (pred_2 ?v5 ?v1) 
                           (pred_5 ?v1 ?v2))                                                          
        :effect (and (not (pred_2 ?v5 ?v1)) (pred_2 ?v5 ?v2)))

(:action op_2 
        :parameters (?v8 - type_1 ?v3 - type_5 ?v5 - type_2)
        :precondition (and (pred_2 ?v5 ?v8) 
                           (pred_2 ?v3 ?v8))
        :effect (and (not (pred_2 ?v3 ?v8))
                     (pred_6 ?v5 ?v3)))

(:action op_1 
        :parameters (?v8 - type_1 ?v3 - type_5 ?v5 - type_2 ?v7 - type_4)
        :precondition (and (pred_2 ?v5 ?v8) 
		      	   (pred_2 ?v7 ?v8)
			   (pred_6 ?v5 ?v3)
			   (pred_1 ?v3)
			   (pred_4 ?v7))
        :effect (and (not (pred_4 ?v7))(not (pred_1 ?v3)) (pred_3 ?v7)))
)