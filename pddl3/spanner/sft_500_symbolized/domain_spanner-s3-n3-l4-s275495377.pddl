(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_1 type_4 - object
	type_3 type_5 type_2 - type_4	
)                                           
                                                                               
(:predicates 
	(pred_1 ?v3 - type_4 ?v6 - type_1)
	(pred_4 ?v3 - type_3 ?v7 - type_2)
	(pred_2 ?v7 - type_2)
	(pred_5 ?v5 - type_1 ?v2 - type_1)
	(pred_3 ?v8 - type_5)
	(pred_6 ?v8 - type_5))                                                                                           
(:action op_2 
        :parameters (?v4 - type_1 ?v1 - type_1 ?v3 - type_3)
        :precondition (and (pred_1 ?v3 ?v4) 
                           (pred_5 ?v4 ?v1))                                                          
        :effect (and (not (pred_1 ?v3 ?v4)) (pred_1 ?v3 ?v1)))

(:action op_3 
        :parameters (?v6 - type_1 ?v7 - type_2 ?v3 - type_3)
        :precondition (and (pred_1 ?v3 ?v6) 
                           (pred_1 ?v7 ?v6))
        :effect (and (not (pred_1 ?v7 ?v6))
                     (pred_4 ?v3 ?v7)))

(:action op_1 
        :parameters (?v6 - type_1 ?v7 - type_2 ?v3 - type_3 ?v8 - type_5)
        :precondition (and (pred_1 ?v3 ?v6) 
		      	   (pred_1 ?v8 ?v6)
			   (pred_4 ?v3 ?v7)
			   (pred_2 ?v7)
			   (pred_6 ?v8))
        :effect (and (not (pred_6 ?v8))(not (pred_2 ?v7)) (pred_3 ?v8)))
)