(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_1 type_3 - object
	type_4 type_5 type_2 - type_3	
)                                           
                                                                               
(:predicates 
	(pred_3 ?v7 - type_3 ?v4 - type_1)
	(pred_2 ?v7 - type_4 ?v5 - type_2)
	(pred_1 ?v5 - type_2)
	(pred_4 ?v8 - type_1 ?v6 - type_1)
	(pred_6 ?v3 - type_5)
	(pred_5 ?v3 - type_5))                                                                                           
(:action op_1 
        :parameters (?v2 - type_1 ?v1 - type_1 ?v7 - type_4)
        :precondition (and (pred_3 ?v7 ?v2) 
                           (pred_4 ?v2 ?v1))                                                          
        :effect (and (not (pred_3 ?v7 ?v2)) (pred_3 ?v7 ?v1)))

(:action op_2 
        :parameters (?v4 - type_1 ?v5 - type_2 ?v7 - type_4)
        :precondition (and (pred_3 ?v7 ?v4) 
                           (pred_3 ?v5 ?v4))
        :effect (and (not (pred_3 ?v5 ?v4))
                     (pred_2 ?v7 ?v5)))

(:action op_3 
        :parameters (?v4 - type_1 ?v5 - type_2 ?v7 - type_4 ?v3 - type_5)
        :precondition (and (pred_3 ?v7 ?v4) 
		      	   (pred_3 ?v3 ?v4)
			   (pred_2 ?v7 ?v5)
			   (pred_1 ?v5)
			   (pred_5 ?v3))
        :effect (and (not (pred_5 ?v3))(not (pred_1 ?v5)) (pred_6 ?v3)))
)