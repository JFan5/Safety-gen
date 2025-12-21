(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_1 type_3 - object
	type_5 type_2 type_4 - type_3	
)                                           
                                                                               
(:predicates 
	(pred_1 ?v2 - type_3 ?v3 - type_1)
	(pred_6 ?v2 - type_5 ?v5 - type_4)
	(pred_2 ?v5 - type_4)
	(pred_5 ?v6 - type_1 ?v1 - type_1)
	(pred_3 ?v4 - type_2)
	(pred_4 ?v4 - type_2))                                                                                           
(:action op_2 
        :parameters (?v8 - type_1 ?v7 - type_1 ?v2 - type_5)
        :precondition (and (pred_1 ?v2 ?v8) 
                           (pred_5 ?v8 ?v7))                                                          
        :effect (and (not (pred_1 ?v2 ?v8)) (pred_1 ?v2 ?v7)))

(:action op_1 
        :parameters (?v3 - type_1 ?v5 - type_4 ?v2 - type_5)
        :precondition (and (pred_1 ?v2 ?v3) 
                           (pred_1 ?v5 ?v3))
        :effect (and (not (pred_1 ?v5 ?v3))
                     (pred_6 ?v2 ?v5)))

(:action op_3 
        :parameters (?v3 - type_1 ?v5 - type_4 ?v2 - type_5 ?v4 - type_2)
        :precondition (and (pred_1 ?v2 ?v3) 
		      	   (pred_1 ?v4 ?v3)
			   (pred_6 ?v2 ?v5)
			   (pred_2 ?v5)
			   (pred_4 ?v4))
        :effect (and (not (pred_4 ?v4))(not (pred_2 ?v5)) (pred_3 ?v4)))
)