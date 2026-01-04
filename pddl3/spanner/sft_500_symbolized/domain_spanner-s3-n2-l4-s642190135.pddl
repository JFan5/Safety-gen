(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_2 type_4 - object
	type_1 type_3 type_5 - type_4	
)                                           
                                                                               
(:predicates 
	(pred_5 ?v3 - type_4 ?v6 - type_2)
	(pred_3 ?v3 - type_1 ?v4 - type_5)
	(pred_1 ?v4 - type_5)
	(pred_4 ?v1 - type_2 ?v7 - type_2)
	(pred_6 ?v8 - type_3)
	(pred_2 ?v8 - type_3))                                                                                           
(:action op_2 
        :parameters (?v2 - type_2 ?v5 - type_2 ?v3 - type_1)
        :precondition (and (pred_5 ?v3 ?v2) 
                           (pred_4 ?v2 ?v5))                                                          
        :effect (and (not (pred_5 ?v3 ?v2)) (pred_5 ?v3 ?v5)))

(:action op_3 
        :parameters (?v6 - type_2 ?v4 - type_5 ?v3 - type_1)
        :precondition (and (pred_5 ?v3 ?v6) 
                           (pred_5 ?v4 ?v6))
        :effect (and (not (pred_5 ?v4 ?v6))
                     (pred_3 ?v3 ?v4)))

(:action op_1 
        :parameters (?v6 - type_2 ?v4 - type_5 ?v3 - type_1 ?v8 - type_3)
        :precondition (and (pred_5 ?v3 ?v6) 
		      	   (pred_5 ?v8 ?v6)
			   (pred_3 ?v3 ?v4)
			   (pred_1 ?v4)
			   (pred_2 ?v8))
        :effect (and (not (pred_2 ?v8))(not (pred_1 ?v4)) (pred_6 ?v8)))
)