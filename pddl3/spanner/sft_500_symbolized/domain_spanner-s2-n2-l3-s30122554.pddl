(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_2 type_5 - object
	type_4 type_3 type_1 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_3 ?v2 - type_5 ?v6 - type_2)
	(pred_2 ?v2 - type_4 ?v4 - type_1)
	(pred_1 ?v4 - type_1)
	(pred_4 ?v1 - type_2 ?v8 - type_2)
	(pred_6 ?v7 - type_3)
	(pred_5 ?v7 - type_3))                                                                                           
(:action op_1 
        :parameters (?v3 - type_2 ?v5 - type_2 ?v2 - type_4)
        :precondition (and (pred_3 ?v2 ?v3) 
                           (pred_4 ?v3 ?v5))                                                          
        :effect (and (not (pred_3 ?v2 ?v3)) (pred_3 ?v2 ?v5)))

(:action op_2 
        :parameters (?v6 - type_2 ?v4 - type_1 ?v2 - type_4)
        :precondition (and (pred_3 ?v2 ?v6) 
                           (pred_3 ?v4 ?v6))
        :effect (and (not (pred_3 ?v4 ?v6))
                     (pred_2 ?v2 ?v4)))

(:action op_3 
        :parameters (?v6 - type_2 ?v4 - type_1 ?v2 - type_4 ?v7 - type_3)
        :precondition (and (pred_3 ?v2 ?v6) 
		      	   (pred_3 ?v7 ?v6)
			   (pred_2 ?v2 ?v4)
			   (pred_1 ?v4)
			   (pred_5 ?v7))
        :effect (and (not (pred_5 ?v7))(not (pred_1 ?v4)) (pred_6 ?v7)))
)