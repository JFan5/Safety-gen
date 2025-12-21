(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_1 type_3 - object
	type_2 type_5 type_4 - type_3	
)                                           
                                                                               
(:predicates 
	(pred_2 ?v4 - type_3 ?v8 - type_1)
	(pred_1 ?v4 - type_2 ?v5 - type_4)
	(pred_4 ?v5 - type_4)
	(pred_3 ?v1 - type_1 ?v6 - type_1)
	(pred_6 ?v3 - type_5)
	(pred_5 ?v3 - type_5))                                                                                           
(:action op_2 
        :parameters (?v7 - type_1 ?v2 - type_1 ?v4 - type_2)
        :precondition (and (pred_2 ?v4 ?v7) 
                           (pred_3 ?v7 ?v2))                                                          
        :effect (and (not (pred_2 ?v4 ?v7)) (pred_2 ?v4 ?v2)))

(:action op_3 
        :parameters (?v8 - type_1 ?v5 - type_4 ?v4 - type_2)
        :precondition (and (pred_2 ?v4 ?v8) 
                           (pred_2 ?v5 ?v8))
        :effect (and (not (pred_2 ?v5 ?v8))
                     (pred_1 ?v4 ?v5)))

(:action op_1 
        :parameters (?v8 - type_1 ?v5 - type_4 ?v4 - type_2 ?v3 - type_5)
        :precondition (and (pred_2 ?v4 ?v8) 
		      	   (pred_2 ?v3 ?v8)
			   (pred_1 ?v4 ?v5)
			   (pred_4 ?v5)
			   (pred_5 ?v3))
        :effect (and (not (pred_5 ?v3))(not (pred_4 ?v5)) (pred_6 ?v3)))
)