(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_5 - object
	type_1 type_4 type_2 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_1 ?v2 - type_5 ?v3 - type_3)
	(pred_6 ?v2 - type_1 ?v7 - type_2)
	(pred_2 ?v7 - type_2)
	(pred_5 ?v4 - type_3 ?v6 - type_3)
	(pred_3 ?v1 - type_4)
	(pred_4 ?v1 - type_4))                                                                                           
(:action op_1 
        :parameters (?v8 - type_3 ?v5 - type_3 ?v2 - type_1)
        :precondition (and (pred_1 ?v2 ?v8) 
                           (pred_5 ?v8 ?v5))                                                          
        :effect (and (not (pred_1 ?v2 ?v8)) (pred_1 ?v2 ?v5)))

(:action op_3 
        :parameters (?v3 - type_3 ?v7 - type_2 ?v2 - type_1)
        :precondition (and (pred_1 ?v2 ?v3) 
                           (pred_1 ?v7 ?v3))
        :effect (and (not (pred_1 ?v7 ?v3))
                     (pred_6 ?v2 ?v7)))

(:action op_2 
        :parameters (?v3 - type_3 ?v7 - type_2 ?v2 - type_1 ?v1 - type_4)
        :precondition (and (pred_1 ?v2 ?v3) 
		      	   (pred_1 ?v1 ?v3)
			   (pred_6 ?v2 ?v7)
			   (pred_2 ?v7)
			   (pred_4 ?v1))
        :effect (and (not (pred_4 ?v1))(not (pred_2 ?v7)) (pred_3 ?v1)))
)