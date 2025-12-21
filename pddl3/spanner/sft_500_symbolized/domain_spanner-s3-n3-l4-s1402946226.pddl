(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_4 type_5 - object
	type_1 type_2 type_3 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_6 ?v8 - type_5 ?v5 - type_4)
	(pred_5 ?v8 - type_1 ?v4 - type_3)
	(pred_2 ?v4 - type_3)
	(pred_1 ?v1 - type_4 ?v2 - type_4)
	(pred_3 ?v7 - type_2)
	(pred_4 ?v7 - type_2))                                                                                           
(:action op_2 
        :parameters (?v3 - type_4 ?v6 - type_4 ?v8 - type_1)
        :precondition (and (pred_6 ?v8 ?v3) 
                           (pred_1 ?v3 ?v6))                                                          
        :effect (and (not (pred_6 ?v8 ?v3)) (pred_6 ?v8 ?v6)))

(:action op_3 
        :parameters (?v5 - type_4 ?v4 - type_3 ?v8 - type_1)
        :precondition (and (pred_6 ?v8 ?v5) 
                           (pred_6 ?v4 ?v5))
        :effect (and (not (pred_6 ?v4 ?v5))
                     (pred_5 ?v8 ?v4)))

(:action op_1 
        :parameters (?v5 - type_4 ?v4 - type_3 ?v8 - type_1 ?v7 - type_2)
        :precondition (and (pred_6 ?v8 ?v5) 
		      	   (pred_6 ?v7 ?v5)
			   (pred_5 ?v8 ?v4)
			   (pred_2 ?v4)
			   (pred_4 ?v7))
        :effect (and (not (pred_4 ?v7))(not (pred_2 ?v4)) (pred_3 ?v7)))
)