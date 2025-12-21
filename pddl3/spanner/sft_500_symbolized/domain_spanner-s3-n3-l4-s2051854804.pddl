(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_4 type_2 - object
	type_3 type_1 type_5 - type_2	
)                                           
                                                                               
(:predicates 
	(pred_3 ?v1 - type_2 ?v8 - type_4)
	(pred_4 ?v1 - type_3 ?v4 - type_5)
	(pred_1 ?v4 - type_5)
	(pred_6 ?v3 - type_4 ?v6 - type_4)
	(pred_5 ?v2 - type_1)
	(pred_2 ?v2 - type_1))                                                                                           
(:action op_1 
        :parameters (?v7 - type_4 ?v5 - type_4 ?v1 - type_3)
        :precondition (and (pred_3 ?v1 ?v7) 
                           (pred_6 ?v7 ?v5))                                                          
        :effect (and (not (pred_3 ?v1 ?v7)) (pred_3 ?v1 ?v5)))

(:action op_2 
        :parameters (?v8 - type_4 ?v4 - type_5 ?v1 - type_3)
        :precondition (and (pred_3 ?v1 ?v8) 
                           (pred_3 ?v4 ?v8))
        :effect (and (not (pred_3 ?v4 ?v8))
                     (pred_4 ?v1 ?v4)))

(:action op_3 
        :parameters (?v8 - type_4 ?v4 - type_5 ?v1 - type_3 ?v2 - type_1)
        :precondition (and (pred_3 ?v1 ?v8) 
		      	   (pred_3 ?v2 ?v8)
			   (pred_4 ?v1 ?v4)
			   (pred_1 ?v4)
			   (pred_2 ?v2))
        :effect (and (not (pred_2 ?v2))(not (pred_1 ?v4)) (pred_5 ?v2)))
)