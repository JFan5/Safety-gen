(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_1 type_4 - object
	type_2 type_5 type_3 - type_4	
)                                           
                                                                               
(:predicates 
	(pred_3 ?v6 - type_4 ?v2 - type_1)
	(pred_4 ?v6 - type_2 ?v1 - type_3)
	(pred_1 ?v1 - type_3)
	(pred_2 ?v8 - type_1 ?v7 - type_1)
	(pred_5 ?v5 - type_5)
	(pred_6 ?v5 - type_5))                                                                                           
(:action op_1 
        :parameters (?v3 - type_1 ?v4 - type_1 ?v6 - type_2)
        :precondition (and (pred_3 ?v6 ?v3) 
                           (pred_2 ?v3 ?v4))                                                          
        :effect (and (not (pred_3 ?v6 ?v3)) (pred_3 ?v6 ?v4)))

(:action op_3 
        :parameters (?v2 - type_1 ?v1 - type_3 ?v6 - type_2)
        :precondition (and (pred_3 ?v6 ?v2) 
                           (pred_3 ?v1 ?v2))
        :effect (and (not (pred_3 ?v1 ?v2))
                     (pred_4 ?v6 ?v1)))

(:action op_2 
        :parameters (?v2 - type_1 ?v1 - type_3 ?v6 - type_2 ?v5 - type_5)
        :precondition (and (pred_3 ?v6 ?v2) 
		      	   (pred_3 ?v5 ?v2)
			   (pred_4 ?v6 ?v1)
			   (pred_1 ?v1)
			   (pred_6 ?v5))
        :effect (and (not (pred_6 ?v5))(not (pred_1 ?v1)) (pred_5 ?v5)))
)