(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_2 type_3 - object
	type_1 type_5 type_4 - type_3	
)                                           
                                                                               
(:predicates 
	(pred_2 ?v5 - type_3 ?v4 - type_2)
	(pred_4 ?v5 - type_1 ?v2 - type_4)
	(pred_5 ?v2 - type_4)
	(pred_1 ?v3 - type_2 ?v8 - type_2)
	(pred_3 ?v6 - type_5)
	(pred_6 ?v6 - type_5))                                                                                           
(:action op_1 
        :parameters (?v1 - type_2 ?v7 - type_2 ?v5 - type_1)
        :precondition (and (pred_2 ?v5 ?v1) 
                           (pred_1 ?v1 ?v7))                                                          
        :effect (and (not (pred_2 ?v5 ?v1)) (pred_2 ?v5 ?v7)))

(:action op_2 
        :parameters (?v4 - type_2 ?v2 - type_4 ?v5 - type_1)
        :precondition (and (pred_2 ?v5 ?v4) 
                           (pred_2 ?v2 ?v4))
        :effect (and (not (pred_2 ?v2 ?v4))
                     (pred_4 ?v5 ?v2)))

(:action op_3 
        :parameters (?v4 - type_2 ?v2 - type_4 ?v5 - type_1 ?v6 - type_5)
        :precondition (and (pred_2 ?v5 ?v4) 
		      	   (pred_2 ?v6 ?v4)
			   (pred_4 ?v5 ?v2)
			   (pred_5 ?v2)
			   (pred_6 ?v6))
        :effect (and (not (pred_6 ?v6))(not (pred_5 ?v2)) (pred_3 ?v6)))
)