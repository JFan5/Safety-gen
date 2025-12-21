(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_1 type_4 - object
	type_5 type_2 type_3 - type_4	
)                                           
                                                                               
(:predicates 
	(pred_3 ?v1 - type_4 ?v8 - type_1)
	(pred_5 ?v1 - type_5 ?v5 - type_3)
	(pred_2 ?v5 - type_3)
	(pred_6 ?v2 - type_1 ?v6 - type_1)
	(pred_4 ?v4 - type_2)
	(pred_1 ?v4 - type_2))                                                                                           
(:action op_1 
        :parameters (?v3 - type_1 ?v7 - type_1 ?v1 - type_5)
        :precondition (and (pred_3 ?v1 ?v3) 
                           (pred_6 ?v3 ?v7))                                                          
        :effect (and (not (pred_3 ?v1 ?v3)) (pred_3 ?v1 ?v7)))

(:action op_3 
        :parameters (?v8 - type_1 ?v5 - type_3 ?v1 - type_5)
        :precondition (and (pred_3 ?v1 ?v8) 
                           (pred_3 ?v5 ?v8))
        :effect (and (not (pred_3 ?v5 ?v8))
                     (pred_5 ?v1 ?v5)))

(:action op_2 
        :parameters (?v8 - type_1 ?v5 - type_3 ?v1 - type_5 ?v4 - type_2)
        :precondition (and (pred_3 ?v1 ?v8) 
		      	   (pred_3 ?v4 ?v8)
			   (pred_5 ?v1 ?v5)
			   (pred_2 ?v5)
			   (pred_1 ?v4))
        :effect (and (not (pred_1 ?v4))(not (pred_2 ?v5)) (pred_4 ?v4)))
)