(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_4 - object
	type_2 type_5 type_1 - type_4	
)                                           
                                                                               
(:predicates 
	(pred_6 ?v2 - type_4 ?v8 - type_3)
	(pred_4 ?v2 - type_2 ?v5 - type_1)
	(pred_5 ?v5 - type_1)
	(pred_3 ?v4 - type_3 ?v1 - type_3)
	(pred_1 ?v3 - type_5)
	(pred_2 ?v3 - type_5))                                                                                           
(:action op_2 
        :parameters (?v7 - type_3 ?v6 - type_3 ?v2 - type_2)
        :precondition (and (pred_6 ?v2 ?v7) 
                           (pred_3 ?v7 ?v6))                                                          
        :effect (and (not (pred_6 ?v2 ?v7)) (pred_6 ?v2 ?v6)))

(:action op_1 
        :parameters (?v8 - type_3 ?v5 - type_1 ?v2 - type_2)
        :precondition (and (pred_6 ?v2 ?v8) 
                           (pred_6 ?v5 ?v8))
        :effect (and (not (pred_6 ?v5 ?v8))
                     (pred_4 ?v2 ?v5)))

(:action op_3 
        :parameters (?v8 - type_3 ?v5 - type_1 ?v2 - type_2 ?v3 - type_5)
        :precondition (and (pred_6 ?v2 ?v8) 
		      	   (pred_6 ?v3 ?v8)
			   (pred_4 ?v2 ?v5)
			   (pred_5 ?v5)
			   (pred_2 ?v3))
        :effect (and (not (pred_2 ?v3))(not (pred_5 ?v5)) (pred_1 ?v3)))
)