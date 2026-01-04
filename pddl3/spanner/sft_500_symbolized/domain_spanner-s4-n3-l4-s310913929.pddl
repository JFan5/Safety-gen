(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_2 type_4 - object
	type_5 type_1 type_3 - type_4	
)                                           
                                                                               
(:predicates 
	(pred_2 ?v1 - type_4 ?v6 - type_2)
	(pred_3 ?v1 - type_5 ?v2 - type_3)
	(pred_6 ?v2 - type_3)
	(pred_5 ?v5 - type_2 ?v3 - type_2)
	(pred_1 ?v7 - type_1)
	(pred_4 ?v7 - type_1))                                                                                           
(:action op_2 
        :parameters (?v8 - type_2 ?v4 - type_2 ?v1 - type_5)
        :precondition (and (pred_2 ?v1 ?v8) 
                           (pred_5 ?v8 ?v4))                                                          
        :effect (and (not (pred_2 ?v1 ?v8)) (pred_2 ?v1 ?v4)))

(:action op_1 
        :parameters (?v6 - type_2 ?v2 - type_3 ?v1 - type_5)
        :precondition (and (pred_2 ?v1 ?v6) 
                           (pred_2 ?v2 ?v6))
        :effect (and (not (pred_2 ?v2 ?v6))
                     (pred_3 ?v1 ?v2)))

(:action op_3 
        :parameters (?v6 - type_2 ?v2 - type_3 ?v1 - type_5 ?v7 - type_1)
        :precondition (and (pred_2 ?v1 ?v6) 
		      	   (pred_2 ?v7 ?v6)
			   (pred_3 ?v1 ?v2)
			   (pred_6 ?v2)
			   (pred_4 ?v7))
        :effect (and (not (pred_4 ?v7))(not (pred_6 ?v2)) (pred_1 ?v7)))
)