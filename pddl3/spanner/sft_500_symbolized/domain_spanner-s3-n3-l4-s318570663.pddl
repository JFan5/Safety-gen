(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_2 type_5 - object
	type_4 type_1 type_3 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_3 ?v2 - type_5 ?v5 - type_2)
	(pred_2 ?v2 - type_4 ?v3 - type_3)
	(pred_5 ?v3 - type_3)
	(pred_6 ?v6 - type_2 ?v1 - type_2)
	(pred_1 ?v7 - type_1)
	(pred_4 ?v7 - type_1))                                                                                           
(:action op_2 
        :parameters (?v4 - type_2 ?v8 - type_2 ?v2 - type_4)
        :precondition (and (pred_3 ?v2 ?v4) 
                           (pred_6 ?v4 ?v8))                                                          
        :effect (and (not (pred_3 ?v2 ?v4)) (pred_3 ?v2 ?v8)))

(:action op_3 
        :parameters (?v5 - type_2 ?v3 - type_3 ?v2 - type_4)
        :precondition (and (pred_3 ?v2 ?v5) 
                           (pred_3 ?v3 ?v5))
        :effect (and (not (pred_3 ?v3 ?v5))
                     (pred_2 ?v2 ?v3)))

(:action op_1 
        :parameters (?v5 - type_2 ?v3 - type_3 ?v2 - type_4 ?v7 - type_1)
        :precondition (and (pred_3 ?v2 ?v5) 
		      	   (pred_3 ?v7 ?v5)
			   (pred_2 ?v2 ?v3)
			   (pred_5 ?v3)
			   (pred_4 ?v7))
        :effect (and (not (pred_4 ?v7))(not (pred_5 ?v3)) (pred_1 ?v7)))
)