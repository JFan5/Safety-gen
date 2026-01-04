(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_4 - object
	type_5 type_1 type_2 - type_4	
)                                           
                                                                               
(:predicates 
	(pred_4 ?v2 - type_4 ?v3 - type_3)
	(pred_5 ?v2 - type_5 ?v1 - type_2)
	(pred_3 ?v1 - type_2)
	(pred_1 ?v5 - type_3 ?v6 - type_3)
	(pred_2 ?v4 - type_1)
	(pred_6 ?v4 - type_1))                                                                                           
(:action op_1 
        :parameters (?v8 - type_3 ?v7 - type_3 ?v2 - type_5)
        :precondition (and (pred_4 ?v2 ?v8) 
                           (pred_1 ?v8 ?v7))                                                          
        :effect (and (not (pred_4 ?v2 ?v8)) (pred_4 ?v2 ?v7)))

(:action op_2 
        :parameters (?v3 - type_3 ?v1 - type_2 ?v2 - type_5)
        :precondition (and (pred_4 ?v2 ?v3) 
                           (pred_4 ?v1 ?v3))
        :effect (and (not (pred_4 ?v1 ?v3))
                     (pred_5 ?v2 ?v1)))

(:action op_3 
        :parameters (?v3 - type_3 ?v1 - type_2 ?v2 - type_5 ?v4 - type_1)
        :precondition (and (pred_4 ?v2 ?v3) 
		      	   (pred_4 ?v4 ?v3)
			   (pred_5 ?v2 ?v1)
			   (pred_3 ?v1)
			   (pred_6 ?v4))
        :effect (and (not (pred_6 ?v4))(not (pred_3 ?v1)) (pred_2 ?v4)))
)