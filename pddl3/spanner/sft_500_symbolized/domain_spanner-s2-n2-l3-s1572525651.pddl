(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_1 type_4 - object
	type_3 type_5 type_2 - type_4	
)                                           
                                                                               
(:predicates 
	(pred_4 ?v5 - type_4 ?v8 - type_1)
	(pred_1 ?v5 - type_3 ?v1 - type_2)
	(pred_6 ?v1 - type_2)
	(pred_5 ?v4 - type_1 ?v2 - type_1)
	(pred_2 ?v7 - type_5)
	(pred_3 ?v7 - type_5))                                                                                           
(:action op_3 
        :parameters (?v3 - type_1 ?v6 - type_1 ?v5 - type_3)
        :precondition (and (pred_4 ?v5 ?v3) 
                           (pred_5 ?v3 ?v6))                                                          
        :effect (and (not (pred_4 ?v5 ?v3)) (pred_4 ?v5 ?v6)))

(:action op_1 
        :parameters (?v8 - type_1 ?v1 - type_2 ?v5 - type_3)
        :precondition (and (pred_4 ?v5 ?v8) 
                           (pred_4 ?v1 ?v8))
        :effect (and (not (pred_4 ?v1 ?v8))
                     (pred_1 ?v5 ?v1)))

(:action op_2 
        :parameters (?v8 - type_1 ?v1 - type_2 ?v5 - type_3 ?v7 - type_5)
        :precondition (and (pred_4 ?v5 ?v8) 
		      	   (pred_4 ?v7 ?v8)
			   (pred_1 ?v5 ?v1)
			   (pred_6 ?v1)
			   (pred_3 ?v7))
        :effect (and (not (pred_3 ?v7))(not (pred_6 ?v1)) (pred_2 ?v7)))
)