(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_4 type_1 - object
	type_5 type_3 type_2 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_1 ?v5 - type_1 ?v8 - type_4)
	(pred_6 ?v5 - type_5 ?v7 - type_2)
	(pred_5 ?v7 - type_2)
	(pred_3 ?v1 - type_4 ?v4 - type_4)
	(pred_2 ?v6 - type_3)
	(pred_4 ?v6 - type_3))                                                                                           
(:action op_3 
        :parameters (?v2 - type_4 ?v3 - type_4 ?v5 - type_5)
        :precondition (and (pred_1 ?v5 ?v2) 
                           (pred_3 ?v2 ?v3))                                                          
        :effect (and (not (pred_1 ?v5 ?v2)) (pred_1 ?v5 ?v3)))

(:action op_2 
        :parameters (?v8 - type_4 ?v7 - type_2 ?v5 - type_5)
        :precondition (and (pred_1 ?v5 ?v8) 
                           (pred_1 ?v7 ?v8))
        :effect (and (not (pred_1 ?v7 ?v8))
                     (pred_6 ?v5 ?v7)))

(:action op_1 
        :parameters (?v8 - type_4 ?v7 - type_2 ?v5 - type_5 ?v6 - type_3)
        :precondition (and (pred_1 ?v5 ?v8) 
		      	   (pred_1 ?v6 ?v8)
			   (pred_6 ?v5 ?v7)
			   (pred_5 ?v7)
			   (pred_4 ?v6))
        :effect (and (not (pred_4 ?v6))(not (pred_5 ?v7)) (pred_2 ?v6)))
)