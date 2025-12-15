(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_5 type_4 - object
	type_3 type_1 type_2 - type_4	
)                                           
                                                                               
(:predicates 
	(pred_3 ?v5 - type_4 ?v1 - type_5)
	(pred_4 ?v5 - type_3 ?v7 - type_2)
	(pred_5 ?v7 - type_2)
	(pred_2 ?v2 - type_5 ?v4 - type_5)
	(pred_1 ?v8 - type_1)
	(pred_6 ?v8 - type_1))                                                                                           
(:action op_3 
        :parameters (?v3 - type_5 ?v6 - type_5 ?v5 - type_3)
        :precondition (and (pred_3 ?v5 ?v3) 
                           (pred_2 ?v3 ?v6))                                                          
        :effect (and (not (pred_3 ?v5 ?v3)) (pred_3 ?v5 ?v6)))

(:action op_1 
        :parameters (?v1 - type_5 ?v7 - type_2 ?v5 - type_3)
        :precondition (and (pred_3 ?v5 ?v1) 
                           (pred_3 ?v7 ?v1))
        :effect (and (not (pred_3 ?v7 ?v1))
                     (pred_4 ?v5 ?v7)))

(:action op_2 
        :parameters (?v1 - type_5 ?v7 - type_2 ?v5 - type_3 ?v8 - type_1)
        :precondition (and (pred_3 ?v5 ?v1) 
		      	   (pred_3 ?v8 ?v1)
			   (pred_4 ?v5 ?v7)
			   (pred_5 ?v7)
			   (pred_6 ?v8))
        :effect (and (not (pred_6 ?v8))(not (pred_5 ?v7)) (pred_1 ?v8)))
)