(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_4 type_2 - object
	type_3 type_5 type_1 - type_2	
)                                           
                                                                               
(:predicates 
	(pred_4 ?v2 - type_2 ?v5 - type_4)
	(pred_5 ?v2 - type_3 ?v7 - type_1)
	(pred_1 ?v7 - type_1)
	(pred_3 ?v3 - type_4 ?v1 - type_4)
	(pred_6 ?v6 - type_5)
	(pred_2 ?v6 - type_5))                                                                                           
(:action op_2 
        :parameters (?v8 - type_4 ?v4 - type_4 ?v2 - type_3)
        :precondition (and (pred_4 ?v2 ?v8) 
                           (pred_3 ?v8 ?v4))                                                          
        :effect (and (not (pred_4 ?v2 ?v8)) (pred_4 ?v2 ?v4)))

(:action op_3 
        :parameters (?v5 - type_4 ?v7 - type_1 ?v2 - type_3)
        :precondition (and (pred_4 ?v2 ?v5) 
                           (pred_4 ?v7 ?v5))
        :effect (and (not (pred_4 ?v7 ?v5))
                     (pred_5 ?v2 ?v7)))

(:action op_1 
        :parameters (?v5 - type_4 ?v7 - type_1 ?v2 - type_3 ?v6 - type_5)
        :precondition (and (pred_4 ?v2 ?v5) 
		      	   (pred_4 ?v6 ?v5)
			   (pred_5 ?v2 ?v7)
			   (pred_1 ?v7)
			   (pred_2 ?v6))
        :effect (and (not (pred_2 ?v6))(not (pred_1 ?v7)) (pred_6 ?v6)))
)