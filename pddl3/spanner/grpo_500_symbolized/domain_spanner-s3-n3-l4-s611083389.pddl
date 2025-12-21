(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_1 - object
	type_5 type_4 type_2 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_1 ?v1 - type_1 ?v8 - type_3)
	(pred_6 ?v1 - type_5 ?v7 - type_2)
	(pred_3 ?v7 - type_2)
	(pred_5 ?v4 - type_3 ?v6 - type_3)
	(pred_2 ?v3 - type_4)
	(pred_4 ?v3 - type_4))                                                                                           
(:action op_3 
        :parameters (?v5 - type_3 ?v2 - type_3 ?v1 - type_5)
        :precondition (and (pred_1 ?v1 ?v5) 
                           (pred_5 ?v5 ?v2))                                                          
        :effect (and (not (pred_1 ?v1 ?v5)) (pred_1 ?v1 ?v2)))

(:action op_2 
        :parameters (?v8 - type_3 ?v7 - type_2 ?v1 - type_5)
        :precondition (and (pred_1 ?v1 ?v8) 
                           (pred_1 ?v7 ?v8))
        :effect (and (not (pred_1 ?v7 ?v8))
                     (pred_6 ?v1 ?v7)))

(:action op_1 
        :parameters (?v8 - type_3 ?v7 - type_2 ?v1 - type_5 ?v3 - type_4)
        :precondition (and (pred_1 ?v1 ?v8) 
		      	   (pred_1 ?v3 ?v8)
			   (pred_6 ?v1 ?v7)
			   (pred_3 ?v7)
			   (pred_4 ?v3))
        :effect (and (not (pred_4 ?v3))(not (pred_3 ?v7)) (pred_2 ?v3)))
)