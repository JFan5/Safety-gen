(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_4 type_1 - object
	type_3 type_2 type_5 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_2 ?v3 - type_1 ?v8 - type_4)
	(pred_5 ?v3 - type_3 ?v7 - type_5)
	(pred_6 ?v7 - type_5)
	(pred_3 ?v4 - type_4 ?v1 - type_4)
	(pred_1 ?v6 - type_2)
	(pred_4 ?v6 - type_2))                                                                                           
(:action op_1 
        :parameters (?v2 - type_4 ?v5 - type_4 ?v3 - type_3)
        :precondition (and (pred_2 ?v3 ?v2) 
                           (pred_3 ?v2 ?v5))                                                          
        :effect (and (not (pred_2 ?v3 ?v2)) (pred_2 ?v3 ?v5)))

(:action op_2 
        :parameters (?v8 - type_4 ?v7 - type_5 ?v3 - type_3)
        :precondition (and (pred_2 ?v3 ?v8) 
                           (pred_2 ?v7 ?v8))
        :effect (and (not (pred_2 ?v7 ?v8))
                     (pred_5 ?v3 ?v7)))

(:action op_3 
        :parameters (?v8 - type_4 ?v7 - type_5 ?v3 - type_3 ?v6 - type_2)
        :precondition (and (pred_2 ?v3 ?v8) 
		      	   (pred_2 ?v6 ?v8)
			   (pred_5 ?v3 ?v7)
			   (pred_6 ?v7)
			   (pred_4 ?v6))
        :effect (and (not (pred_4 ?v6))(not (pred_6 ?v7)) (pred_1 ?v6)))
)