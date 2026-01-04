(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_1 type_4 - object
	type_5 type_2 type_3 - type_4	
)                                           
                                                                               
(:predicates 
	(pred_3 ?v6 - type_4 ?v3 - type_1)
	(pred_1 ?v6 - type_5 ?v2 - type_3)
	(pred_2 ?v2 - type_3)
	(pred_6 ?v8 - type_1 ?v5 - type_1)
	(pred_5 ?v7 - type_2)
	(pred_4 ?v7 - type_2))                                                                                           
(:action op_2 
        :parameters (?v4 - type_1 ?v1 - type_1 ?v6 - type_5)
        :precondition (and (pred_3 ?v6 ?v4) 
                           (pred_6 ?v4 ?v1))                                                          
        :effect (and (not (pred_3 ?v6 ?v4)) (pred_3 ?v6 ?v1)))

(:action op_3 
        :parameters (?v3 - type_1 ?v2 - type_3 ?v6 - type_5)
        :precondition (and (pred_3 ?v6 ?v3) 
                           (pred_3 ?v2 ?v3))
        :effect (and (not (pred_3 ?v2 ?v3))
                     (pred_1 ?v6 ?v2)))

(:action op_1 
        :parameters (?v3 - type_1 ?v2 - type_3 ?v6 - type_5 ?v7 - type_2)
        :precondition (and (pred_3 ?v6 ?v3) 
		      	   (pred_3 ?v7 ?v3)
			   (pred_1 ?v6 ?v2)
			   (pred_2 ?v2)
			   (pred_4 ?v7))
        :effect (and (not (pred_4 ?v7))(not (pred_2 ?v2)) (pred_5 ?v7)))
)