(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_4 type_3 - object
	type_5 type_2 type_1 - type_3	
)                                           
                                                                               
(:predicates 
	(pred_1 ?v5 - type_3 ?v7 - type_4)
	(pred_2 ?v5 - type_5 ?v8 - type_1)
	(pred_5 ?v8 - type_1)
	(pred_3 ?v1 - type_4 ?v6 - type_4)
	(pred_6 ?v3 - type_2)
	(pred_4 ?v3 - type_2))                                                                                           
(:action op_3 
        :parameters (?v2 - type_4 ?v4 - type_4 ?v5 - type_5)
        :precondition (and (pred_1 ?v5 ?v2) 
                           (pred_3 ?v2 ?v4))                                                          
        :effect (and (not (pred_1 ?v5 ?v2)) (pred_1 ?v5 ?v4)))

(:action op_2 
        :parameters (?v7 - type_4 ?v8 - type_1 ?v5 - type_5)
        :precondition (and (pred_1 ?v5 ?v7) 
                           (pred_1 ?v8 ?v7))
        :effect (and (not (pred_1 ?v8 ?v7))
                     (pred_2 ?v5 ?v8)))

(:action op_1 
        :parameters (?v7 - type_4 ?v8 - type_1 ?v5 - type_5 ?v3 - type_2)
        :precondition (and (pred_1 ?v5 ?v7) 
		      	   (pred_1 ?v3 ?v7)
			   (pred_2 ?v5 ?v8)
			   (pred_5 ?v8)
			   (pred_4 ?v3))
        :effect (and (not (pred_4 ?v3))(not (pred_5 ?v8)) (pred_6 ?v3)))
)