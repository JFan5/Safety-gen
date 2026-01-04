(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_5 type_2 - object
	type_1 type_3 type_4 - type_2	
)                                           
                                                                               
(:predicates 
	(pred_1 ?v2 - type_2 ?v5 - type_5)
	(pred_4 ?v2 - type_1 ?v4 - type_4)
	(pred_2 ?v4 - type_4)
	(pred_5 ?v7 - type_5 ?v6 - type_5)
	(pred_3 ?v8 - type_3)
	(pred_6 ?v8 - type_3))                                                                                           
(:action op_3 
        :parameters (?v3 - type_5 ?v1 - type_5 ?v2 - type_1)
        :precondition (and (pred_1 ?v2 ?v3) 
                           (pred_5 ?v3 ?v1))                                                          
        :effect (and (not (pred_1 ?v2 ?v3)) (pred_1 ?v2 ?v1)))

(:action op_2 
        :parameters (?v5 - type_5 ?v4 - type_4 ?v2 - type_1)
        :precondition (and (pred_1 ?v2 ?v5) 
                           (pred_1 ?v4 ?v5))
        :effect (and (not (pred_1 ?v4 ?v5))
                     (pred_4 ?v2 ?v4)))

(:action op_1 
        :parameters (?v5 - type_5 ?v4 - type_4 ?v2 - type_1 ?v8 - type_3)
        :precondition (and (pred_1 ?v2 ?v5) 
		      	   (pred_1 ?v8 ?v5)
			   (pred_4 ?v2 ?v4)
			   (pred_2 ?v4)
			   (pred_6 ?v8))
        :effect (and (not (pred_6 ?v8))(not (pred_2 ?v4)) (pred_3 ?v8)))
)