(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_1 type_5 - object
	type_3 type_2 type_4 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_3 ?v4 - type_5 ?v2 - type_1)
	(pred_4 ?v4 - type_3 ?v3 - type_4)
	(pred_1 ?v3 - type_4)
	(pred_5 ?v1 - type_1 ?v8 - type_1)
	(pred_2 ?v6 - type_2)
	(pred_6 ?v6 - type_2))                                                                                           
(:action op_2 
        :parameters (?v7 - type_1 ?v5 - type_1 ?v4 - type_3)
        :precondition (and (pred_3 ?v4 ?v7) 
                           (pred_5 ?v7 ?v5))                                                          
        :effect (and (not (pred_3 ?v4 ?v7)) (pred_3 ?v4 ?v5)))

(:action op_3 
        :parameters (?v2 - type_1 ?v3 - type_4 ?v4 - type_3)
        :precondition (and (pred_3 ?v4 ?v2) 
                           (pred_3 ?v3 ?v2))
        :effect (and (not (pred_3 ?v3 ?v2))
                     (pred_4 ?v4 ?v3)))

(:action op_1 
        :parameters (?v2 - type_1 ?v3 - type_4 ?v4 - type_3 ?v6 - type_2)
        :precondition (and (pred_3 ?v4 ?v2) 
		      	   (pred_3 ?v6 ?v2)
			   (pred_4 ?v4 ?v3)
			   (pred_1 ?v3)
			   (pred_6 ?v6))
        :effect (and (not (pred_6 ?v6))(not (pred_1 ?v3)) (pred_2 ?v6)))
)