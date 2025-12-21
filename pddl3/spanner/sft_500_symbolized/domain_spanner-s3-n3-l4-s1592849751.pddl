(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_4 type_1 - object
	type_5 type_2 type_3 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_2 ?v5 - type_1 ?v2 - type_4)
	(pred_4 ?v5 - type_5 ?v8 - type_3)
	(pred_6 ?v8 - type_3)
	(pred_1 ?v3 - type_4 ?v6 - type_4)
	(pred_3 ?v1 - type_2)
	(pred_5 ?v1 - type_2))                                                                                           
(:action op_2 
        :parameters (?v7 - type_4 ?v4 - type_4 ?v5 - type_5)
        :precondition (and (pred_2 ?v5 ?v7) 
                           (pred_1 ?v7 ?v4))                                                          
        :effect (and (not (pred_2 ?v5 ?v7)) (pred_2 ?v5 ?v4)))

(:action op_1 
        :parameters (?v2 - type_4 ?v8 - type_3 ?v5 - type_5)
        :precondition (and (pred_2 ?v5 ?v2) 
                           (pred_2 ?v8 ?v2))
        :effect (and (not (pred_2 ?v8 ?v2))
                     (pred_4 ?v5 ?v8)))

(:action op_3 
        :parameters (?v2 - type_4 ?v8 - type_3 ?v5 - type_5 ?v1 - type_2)
        :precondition (and (pred_2 ?v5 ?v2) 
		      	   (pred_2 ?v1 ?v2)
			   (pred_4 ?v5 ?v8)
			   (pred_6 ?v8)
			   (pred_5 ?v1))
        :effect (and (not (pred_5 ?v1))(not (pred_6 ?v8)) (pred_3 ?v1)))
)