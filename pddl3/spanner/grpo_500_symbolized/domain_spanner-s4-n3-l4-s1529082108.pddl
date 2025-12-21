(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_1 - object
	type_4 type_5 type_2 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_1 ?v5 - type_1 ?v3 - type_3)
	(pred_2 ?v5 - type_4 ?v1 - type_2)
	(pred_6 ?v1 - type_2)
	(pred_4 ?v4 - type_3 ?v6 - type_3)
	(pred_5 ?v7 - type_5)
	(pred_3 ?v7 - type_5))                                                                                           
(:action op_1 
        :parameters (?v8 - type_3 ?v2 - type_3 ?v5 - type_4)
        :precondition (and (pred_1 ?v5 ?v8) 
                           (pred_4 ?v8 ?v2))                                                          
        :effect (and (not (pred_1 ?v5 ?v8)) (pred_1 ?v5 ?v2)))

(:action op_3 
        :parameters (?v3 - type_3 ?v1 - type_2 ?v5 - type_4)
        :precondition (and (pred_1 ?v5 ?v3) 
                           (pred_1 ?v1 ?v3))
        :effect (and (not (pred_1 ?v1 ?v3))
                     (pred_2 ?v5 ?v1)))

(:action op_2 
        :parameters (?v3 - type_3 ?v1 - type_2 ?v5 - type_4 ?v7 - type_5)
        :precondition (and (pred_1 ?v5 ?v3) 
		      	   (pred_1 ?v7 ?v3)
			   (pred_2 ?v5 ?v1)
			   (pred_6 ?v1)
			   (pred_3 ?v7))
        :effect (and (not (pred_3 ?v7))(not (pred_6 ?v1)) (pred_5 ?v7)))
)