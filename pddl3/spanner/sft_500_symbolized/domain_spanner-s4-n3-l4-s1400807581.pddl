(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_2 type_3 - object
	type_4 type_1 type_5 - type_3	
)                                           
                                                                               
(:predicates 
	(pred_3 ?v5 - type_3 ?v7 - type_2)
	(pred_4 ?v5 - type_4 ?v1 - type_5)
	(pred_1 ?v1 - type_5)
	(pred_6 ?v3 - type_2 ?v8 - type_2)
	(pred_2 ?v4 - type_1)
	(pred_5 ?v4 - type_1))                                                                                           
(:action op_2 
        :parameters (?v2 - type_2 ?v6 - type_2 ?v5 - type_4)
        :precondition (and (pred_3 ?v5 ?v2) 
                           (pred_6 ?v2 ?v6))                                                          
        :effect (and (not (pred_3 ?v5 ?v2)) (pred_3 ?v5 ?v6)))

(:action op_1 
        :parameters (?v7 - type_2 ?v1 - type_5 ?v5 - type_4)
        :precondition (and (pred_3 ?v5 ?v7) 
                           (pred_3 ?v1 ?v7))
        :effect (and (not (pred_3 ?v1 ?v7))
                     (pred_4 ?v5 ?v1)))

(:action op_3 
        :parameters (?v7 - type_2 ?v1 - type_5 ?v5 - type_4 ?v4 - type_1)
        :precondition (and (pred_3 ?v5 ?v7) 
		      	   (pred_3 ?v4 ?v7)
			   (pred_4 ?v5 ?v1)
			   (pred_1 ?v1)
			   (pred_5 ?v4))
        :effect (and (not (pred_5 ?v4))(not (pred_1 ?v1)) (pred_2 ?v4)))
)