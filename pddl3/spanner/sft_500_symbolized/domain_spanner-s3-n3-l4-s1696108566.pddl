(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_4 - object
	type_5 type_1 type_2 - type_4	
)                                           
                                                                               
(:predicates 
	(pred_4 ?v2 - type_4 ?v4 - type_3)
	(pred_3 ?v2 - type_5 ?v7 - type_2)
	(pred_2 ?v7 - type_2)
	(pred_1 ?v3 - type_3 ?v1 - type_3)
	(pred_6 ?v6 - type_1)
	(pred_5 ?v6 - type_1))                                                                                           
(:action op_3 
        :parameters (?v8 - type_3 ?v5 - type_3 ?v2 - type_5)
        :precondition (and (pred_4 ?v2 ?v8) 
                           (pred_1 ?v8 ?v5))                                                          
        :effect (and (not (pred_4 ?v2 ?v8)) (pred_4 ?v2 ?v5)))

(:action op_1 
        :parameters (?v4 - type_3 ?v7 - type_2 ?v2 - type_5)
        :precondition (and (pred_4 ?v2 ?v4) 
                           (pred_4 ?v7 ?v4))
        :effect (and (not (pred_4 ?v7 ?v4))
                     (pred_3 ?v2 ?v7)))

(:action op_2 
        :parameters (?v4 - type_3 ?v7 - type_2 ?v2 - type_5 ?v6 - type_1)
        :precondition (and (pred_4 ?v2 ?v4) 
		      	   (pred_4 ?v6 ?v4)
			   (pred_3 ?v2 ?v7)
			   (pred_2 ?v7)
			   (pred_5 ?v6))
        :effect (and (not (pred_5 ?v6))(not (pred_2 ?v7)) (pred_6 ?v6)))
)