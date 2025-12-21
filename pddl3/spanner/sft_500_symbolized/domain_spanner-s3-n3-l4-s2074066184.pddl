(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_2 - object
	type_4 type_5 type_1 - type_2	
)                                           
                                                                               
(:predicates 
	(pred_2 ?v2 - type_2 ?v4 - type_3)
	(pred_1 ?v2 - type_4 ?v7 - type_1)
	(pred_5 ?v7 - type_1)
	(pred_3 ?v6 - type_3 ?v1 - type_3)
	(pred_6 ?v5 - type_5)
	(pred_4 ?v5 - type_5))                                                                                           
(:action op_2 
        :parameters (?v3 - type_3 ?v8 - type_3 ?v2 - type_4)
        :precondition (and (pred_2 ?v2 ?v3) 
                           (pred_3 ?v3 ?v8))                                                          
        :effect (and (not (pred_2 ?v2 ?v3)) (pred_2 ?v2 ?v8)))

(:action op_3 
        :parameters (?v4 - type_3 ?v7 - type_1 ?v2 - type_4)
        :precondition (and (pred_2 ?v2 ?v4) 
                           (pred_2 ?v7 ?v4))
        :effect (and (not (pred_2 ?v7 ?v4))
                     (pred_1 ?v2 ?v7)))

(:action op_1 
        :parameters (?v4 - type_3 ?v7 - type_1 ?v2 - type_4 ?v5 - type_5)
        :precondition (and (pred_2 ?v2 ?v4) 
		      	   (pred_2 ?v5 ?v4)
			   (pred_1 ?v2 ?v7)
			   (pred_5 ?v7)
			   (pred_4 ?v5))
        :effect (and (not (pred_4 ?v5))(not (pred_5 ?v7)) (pred_6 ?v5)))
)