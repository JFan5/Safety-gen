(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_2 - object
	type_1 type_5 type_4 - type_2	
)                                           
                                                                               
(:predicates 
	(pred_3 ?v3 - type_2 ?v2 - type_3)
	(pred_1 ?v3 - type_1 ?v4 - type_4)
	(pred_4 ?v4 - type_4)
	(pred_2 ?v1 - type_3 ?v5 - type_3)
	(pred_6 ?v8 - type_5)
	(pred_5 ?v8 - type_5))                                                                                           
(:action op_1 
        :parameters (?v6 - type_3 ?v7 - type_3 ?v3 - type_1)
        :precondition (and (pred_3 ?v3 ?v6) 
                           (pred_2 ?v6 ?v7))                                                          
        :effect (and (not (pred_3 ?v3 ?v6)) (pred_3 ?v3 ?v7)))

(:action op_3 
        :parameters (?v2 - type_3 ?v4 - type_4 ?v3 - type_1)
        :precondition (and (pred_3 ?v3 ?v2) 
                           (pred_3 ?v4 ?v2))
        :effect (and (not (pred_3 ?v4 ?v2))
                     (pred_1 ?v3 ?v4)))

(:action op_2 
        :parameters (?v2 - type_3 ?v4 - type_4 ?v3 - type_1 ?v8 - type_5)
        :precondition (and (pred_3 ?v3 ?v2) 
		      	   (pred_3 ?v8 ?v2)
			   (pred_1 ?v3 ?v4)
			   (pred_4 ?v4)
			   (pred_5 ?v8))
        :effect (and (not (pred_5 ?v8))(not (pred_4 ?v4)) (pred_6 ?v8)))
)