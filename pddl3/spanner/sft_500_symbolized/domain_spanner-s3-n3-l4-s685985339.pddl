(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_4 - object
	type_1 type_5 type_2 - type_4	
)                                           
                                                                               
(:predicates 
	(pred_1 ?v6 - type_4 ?v1 - type_3)
	(pred_3 ?v6 - type_1 ?v2 - type_2)
	(pred_2 ?v2 - type_2)
	(pred_5 ?v8 - type_3 ?v3 - type_3)
	(pred_6 ?v4 - type_5)
	(pred_4 ?v4 - type_5))                                                                                           
(:action op_2 
        :parameters (?v7 - type_3 ?v5 - type_3 ?v6 - type_1)
        :precondition (and (pred_1 ?v6 ?v7) 
                           (pred_5 ?v7 ?v5))                                                          
        :effect (and (not (pred_1 ?v6 ?v7)) (pred_1 ?v6 ?v5)))

(:action op_1 
        :parameters (?v1 - type_3 ?v2 - type_2 ?v6 - type_1)
        :precondition (and (pred_1 ?v6 ?v1) 
                           (pred_1 ?v2 ?v1))
        :effect (and (not (pred_1 ?v2 ?v1))
                     (pred_3 ?v6 ?v2)))

(:action op_3 
        :parameters (?v1 - type_3 ?v2 - type_2 ?v6 - type_1 ?v4 - type_5)
        :precondition (and (pred_1 ?v6 ?v1) 
		      	   (pred_1 ?v4 ?v1)
			   (pred_3 ?v6 ?v2)
			   (pred_2 ?v2)
			   (pred_4 ?v4))
        :effect (and (not (pred_4 ?v4))(not (pred_2 ?v2)) (pred_6 ?v4)))
)