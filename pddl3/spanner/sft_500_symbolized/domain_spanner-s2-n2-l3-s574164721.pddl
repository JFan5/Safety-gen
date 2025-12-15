(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_2 type_3 - object
	type_5 type_1 type_4 - type_3	
)                                           
                                                                               
(:predicates 
	(pred_4 ?v8 - type_3 ?v2 - type_2)
	(pred_3 ?v8 - type_5 ?v7 - type_4)
	(pred_5 ?v7 - type_4)
	(pred_1 ?v5 - type_2 ?v1 - type_2)
	(pred_6 ?v6 - type_1)
	(pred_2 ?v6 - type_1))                                                                                           
(:action op_2 
        :parameters (?v3 - type_2 ?v4 - type_2 ?v8 - type_5)
        :precondition (and (pred_4 ?v8 ?v3) 
                           (pred_1 ?v3 ?v4))                                                          
        :effect (and (not (pred_4 ?v8 ?v3)) (pred_4 ?v8 ?v4)))

(:action op_3 
        :parameters (?v2 - type_2 ?v7 - type_4 ?v8 - type_5)
        :precondition (and (pred_4 ?v8 ?v2) 
                           (pred_4 ?v7 ?v2))
        :effect (and (not (pred_4 ?v7 ?v2))
                     (pred_3 ?v8 ?v7)))

(:action op_1 
        :parameters (?v2 - type_2 ?v7 - type_4 ?v8 - type_5 ?v6 - type_1)
        :precondition (and (pred_4 ?v8 ?v2) 
		      	   (pred_4 ?v6 ?v2)
			   (pred_3 ?v8 ?v7)
			   (pred_5 ?v7)
			   (pred_2 ?v6))
        :effect (and (not (pred_2 ?v6))(not (pred_5 ?v7)) (pred_6 ?v6)))
)