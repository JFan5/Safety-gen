(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_4 type_3 - object
	type_1 type_5 type_2 - type_3	
)                                           
                                                                               
(:predicates 
	(pred_1 ?v5 - type_3 ?v8 - type_4)
	(pred_6 ?v5 - type_1 ?v4 - type_2)
	(pred_2 ?v4 - type_2)
	(pred_4 ?v1 - type_4 ?v2 - type_4)
	(pred_5 ?v6 - type_5)
	(pred_3 ?v6 - type_5))                                                                                           
(:action op_3 
        :parameters (?v7 - type_4 ?v3 - type_4 ?v5 - type_1)
        :precondition (and (pred_1 ?v5 ?v7) 
                           (pred_4 ?v7 ?v3))                                                          
        :effect (and (not (pred_1 ?v5 ?v7)) (pred_1 ?v5 ?v3)))

(:action op_1 
        :parameters (?v8 - type_4 ?v4 - type_2 ?v5 - type_1)
        :precondition (and (pred_1 ?v5 ?v8) 
                           (pred_1 ?v4 ?v8))
        :effect (and (not (pred_1 ?v4 ?v8))
                     (pred_6 ?v5 ?v4)))

(:action op_2 
        :parameters (?v8 - type_4 ?v4 - type_2 ?v5 - type_1 ?v6 - type_5)
        :precondition (and (pred_1 ?v5 ?v8) 
		      	   (pred_1 ?v6 ?v8)
			   (pred_6 ?v5 ?v4)
			   (pred_2 ?v4)
			   (pred_3 ?v6))
        :effect (and (not (pred_3 ?v6))(not (pred_2 ?v4)) (pred_5 ?v6)))
)