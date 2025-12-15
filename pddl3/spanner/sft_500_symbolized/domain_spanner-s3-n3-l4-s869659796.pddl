(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_1 type_5 - object
	type_3 type_4 type_2 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_2 ?v5 - type_5 ?v8 - type_1)
	(pred_5 ?v5 - type_3 ?v7 - type_2)
	(pred_4 ?v7 - type_2)
	(pred_6 ?v2 - type_1 ?v4 - type_1)
	(pred_3 ?v1 - type_4)
	(pred_1 ?v1 - type_4))                                                                                           
(:action op_1 
        :parameters (?v3 - type_1 ?v6 - type_1 ?v5 - type_3)
        :precondition (and (pred_2 ?v5 ?v3) 
                           (pred_6 ?v3 ?v6))                                                          
        :effect (and (not (pred_2 ?v5 ?v3)) (pred_2 ?v5 ?v6)))

(:action op_2 
        :parameters (?v8 - type_1 ?v7 - type_2 ?v5 - type_3)
        :precondition (and (pred_2 ?v5 ?v8) 
                           (pred_2 ?v7 ?v8))
        :effect (and (not (pred_2 ?v7 ?v8))
                     (pred_5 ?v5 ?v7)))

(:action op_3 
        :parameters (?v8 - type_1 ?v7 - type_2 ?v5 - type_3 ?v1 - type_4)
        :precondition (and (pred_2 ?v5 ?v8) 
		      	   (pred_2 ?v1 ?v8)
			   (pred_5 ?v5 ?v7)
			   (pred_4 ?v7)
			   (pred_1 ?v1))
        :effect (and (not (pred_1 ?v1))(not (pred_4 ?v7)) (pred_3 ?v1)))
)