(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_5 - object
	type_1 type_2 type_4 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_5 ?v5 - type_5 ?v8 - type_3)
	(pred_3 ?v5 - type_1 ?v7 - type_4)
	(pred_6 ?v7 - type_4)
	(pred_2 ?v1 - type_3 ?v4 - type_3)
	(pred_1 ?v6 - type_2)
	(pred_4 ?v6 - type_2))                                                                                           
(:action op_2 
        :parameters (?v2 - type_3 ?v3 - type_3 ?v5 - type_1)
        :precondition (and (pred_5 ?v5 ?v2) 
                           (pred_2 ?v2 ?v3))                                                          
        :effect (and (not (pred_5 ?v5 ?v2)) (pred_5 ?v5 ?v3)))

(:action op_3 
        :parameters (?v8 - type_3 ?v7 - type_4 ?v5 - type_1)
        :precondition (and (pred_5 ?v5 ?v8) 
                           (pred_5 ?v7 ?v8))
        :effect (and (not (pred_5 ?v7 ?v8))
                     (pred_3 ?v5 ?v7)))

(:action op_1 
        :parameters (?v8 - type_3 ?v7 - type_4 ?v5 - type_1 ?v6 - type_2)
        :precondition (and (pred_5 ?v5 ?v8) 
		      	   (pred_5 ?v6 ?v8)
			   (pred_3 ?v5 ?v7)
			   (pred_6 ?v7)
			   (pred_4 ?v6))
        :effect (and (not (pred_4 ?v6))(not (pred_6 ?v7)) (pred_1 ?v6)))
)