(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_4 - object
	type_5 type_2 type_1 - type_4	
)                                           
                                                                               
(:predicates 
	(pred_3 ?v5 - type_4 ?v4 - type_3)
	(pred_5 ?v5 - type_5 ?v8 - type_1)
	(pred_2 ?v8 - type_1)
	(pred_4 ?v2 - type_3 ?v1 - type_3)
	(pred_6 ?v3 - type_2)
	(pred_1 ?v3 - type_2))                                                                                           
(:action op_1 
        :parameters (?v7 - type_3 ?v6 - type_3 ?v5 - type_5)
        :precondition (and (pred_3 ?v5 ?v7) 
                           (pred_4 ?v7 ?v6))                                                          
        :effect (and (not (pred_3 ?v5 ?v7)) (pred_3 ?v5 ?v6)))

(:action op_2 
        :parameters (?v4 - type_3 ?v8 - type_1 ?v5 - type_5)
        :precondition (and (pred_3 ?v5 ?v4) 
                           (pred_3 ?v8 ?v4))
        :effect (and (not (pred_3 ?v8 ?v4))
                     (pred_5 ?v5 ?v8)))

(:action op_3 
        :parameters (?v4 - type_3 ?v8 - type_1 ?v5 - type_5 ?v3 - type_2)
        :precondition (and (pred_3 ?v5 ?v4) 
		      	   (pred_3 ?v3 ?v4)
			   (pred_5 ?v5 ?v8)
			   (pred_2 ?v8)
			   (pred_1 ?v3))
        :effect (and (not (pred_1 ?v3))(not (pred_2 ?v8)) (pred_6 ?v3)))
)