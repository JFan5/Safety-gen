(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_2 type_4 - object
	type_1 type_5 type_3 - type_4	
)                                           
                                                                               
(:predicates 
	(pred_2 ?v7 - type_4 ?v4 - type_2)
	(pred_1 ?v7 - type_1 ?v3 - type_3)
	(pred_4 ?v3 - type_3)
	(pred_6 ?v2 - type_2 ?v5 - type_2)
	(pred_5 ?v1 - type_5)
	(pred_3 ?v1 - type_5))                                                                                           
(:action op_3 
        :parameters (?v8 - type_2 ?v6 - type_2 ?v7 - type_1)
        :precondition (and (pred_2 ?v7 ?v8) 
                           (pred_6 ?v8 ?v6))                                                          
        :effect (and (not (pred_2 ?v7 ?v8)) (pred_2 ?v7 ?v6)))

(:action op_2 
        :parameters (?v4 - type_2 ?v3 - type_3 ?v7 - type_1)
        :precondition (and (pred_2 ?v7 ?v4) 
                           (pred_2 ?v3 ?v4))
        :effect (and (not (pred_2 ?v3 ?v4))
                     (pred_1 ?v7 ?v3)))

(:action op_1 
        :parameters (?v4 - type_2 ?v3 - type_3 ?v7 - type_1 ?v1 - type_5)
        :precondition (and (pred_2 ?v7 ?v4) 
		      	   (pred_2 ?v1 ?v4)
			   (pred_1 ?v7 ?v3)
			   (pred_4 ?v3)
			   (pred_3 ?v1))
        :effect (and (not (pred_3 ?v1))(not (pred_4 ?v3)) (pred_5 ?v1)))
)