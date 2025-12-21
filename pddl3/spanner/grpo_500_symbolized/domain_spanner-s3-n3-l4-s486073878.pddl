(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_4 - object
	type_2 type_5 type_1 - type_4	
)                                           
                                                                               
(:predicates 
	(pred_2 ?v5 - type_4 ?v7 - type_3)
	(pred_5 ?v5 - type_2 ?v8 - type_1)
	(pred_3 ?v8 - type_1)
	(pred_1 ?v2 - type_3 ?v3 - type_3)
	(pred_6 ?v4 - type_5)
	(pred_4 ?v4 - type_5))                                                                                           
(:action op_3 
        :parameters (?v1 - type_3 ?v6 - type_3 ?v5 - type_2)
        :precondition (and (pred_2 ?v5 ?v1) 
                           (pred_1 ?v1 ?v6))                                                          
        :effect (and (not (pred_2 ?v5 ?v1)) (pred_2 ?v5 ?v6)))

(:action op_2 
        :parameters (?v7 - type_3 ?v8 - type_1 ?v5 - type_2)
        :precondition (and (pred_2 ?v5 ?v7) 
                           (pred_2 ?v8 ?v7))
        :effect (and (not (pred_2 ?v8 ?v7))
                     (pred_5 ?v5 ?v8)))

(:action op_1 
        :parameters (?v7 - type_3 ?v8 - type_1 ?v5 - type_2 ?v4 - type_5)
        :precondition (and (pred_2 ?v5 ?v7) 
		      	   (pred_2 ?v4 ?v7)
			   (pred_5 ?v5 ?v8)
			   (pred_3 ?v8)
			   (pred_4 ?v4))
        :effect (and (not (pred_4 ?v4))(not (pred_3 ?v8)) (pred_6 ?v4)))
)