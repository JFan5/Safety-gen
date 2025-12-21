(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_1 type_3 - object
	type_4 type_5 type_2 - type_3	
)                                           
                                                                               
(:predicates 
	(pred_3 ?v6 - type_3 ?v2 - type_1)
	(pred_6 ?v6 - type_4 ?v7 - type_2)
	(pred_2 ?v7 - type_2)
	(pred_5 ?v5 - type_1 ?v4 - type_1)
	(pred_4 ?v8 - type_5)
	(pred_1 ?v8 - type_5))                                                                                           
(:action op_1 
        :parameters (?v3 - type_1 ?v1 - type_1 ?v6 - type_4)
        :precondition (and (pred_3 ?v6 ?v3) 
                           (pred_5 ?v3 ?v1))                                                          
        :effect (and (not (pred_3 ?v6 ?v3)) (pred_3 ?v6 ?v1)))

(:action op_2 
        :parameters (?v2 - type_1 ?v7 - type_2 ?v6 - type_4)
        :precondition (and (pred_3 ?v6 ?v2) 
                           (pred_3 ?v7 ?v2))
        :effect (and (not (pred_3 ?v7 ?v2))
                     (pred_6 ?v6 ?v7)))

(:action op_3 
        :parameters (?v2 - type_1 ?v7 - type_2 ?v6 - type_4 ?v8 - type_5)
        :precondition (and (pred_3 ?v6 ?v2) 
		      	   (pred_3 ?v8 ?v2)
			   (pred_6 ?v6 ?v7)
			   (pred_2 ?v7)
			   (pred_1 ?v8))
        :effect (and (not (pred_1 ?v8))(not (pred_2 ?v7)) (pred_4 ?v8)))
)