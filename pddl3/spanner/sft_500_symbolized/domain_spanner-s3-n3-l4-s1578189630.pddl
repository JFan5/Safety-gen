(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_5 type_4 - object
	type_1 type_3 type_2 - type_4	
)                                           
                                                                               
(:predicates 
	(pred_4 ?v4 - type_4 ?v7 - type_5)
	(pred_6 ?v4 - type_1 ?v3 - type_2)
	(pred_2 ?v3 - type_2)
	(pred_3 ?v1 - type_5 ?v6 - type_5)
	(pred_5 ?v8 - type_3)
	(pred_1 ?v8 - type_3))                                                                                           
(:action op_3 
        :parameters (?v2 - type_5 ?v5 - type_5 ?v4 - type_1)
        :precondition (and (pred_4 ?v4 ?v2) 
                           (pred_3 ?v2 ?v5))                                                          
        :effect (and (not (pred_4 ?v4 ?v2)) (pred_4 ?v4 ?v5)))

(:action op_2 
        :parameters (?v7 - type_5 ?v3 - type_2 ?v4 - type_1)
        :precondition (and (pred_4 ?v4 ?v7) 
                           (pred_4 ?v3 ?v7))
        :effect (and (not (pred_4 ?v3 ?v7))
                     (pred_6 ?v4 ?v3)))

(:action op_1 
        :parameters (?v7 - type_5 ?v3 - type_2 ?v4 - type_1 ?v8 - type_3)
        :precondition (and (pred_4 ?v4 ?v7) 
		      	   (pred_4 ?v8 ?v7)
			   (pred_6 ?v4 ?v3)
			   (pred_2 ?v3)
			   (pred_1 ?v8))
        :effect (and (not (pred_1 ?v8))(not (pred_2 ?v3)) (pred_5 ?v8)))
)