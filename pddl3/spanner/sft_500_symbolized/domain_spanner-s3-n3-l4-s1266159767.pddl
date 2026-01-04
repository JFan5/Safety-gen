(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_4 type_3 - object
	type_5 type_2 type_1 - type_3	
)                                           
                                                                               
(:predicates 
	(pred_1 ?v1 - type_3 ?v5 - type_4)
	(pred_2 ?v1 - type_5 ?v6 - type_1)
	(pred_4 ?v6 - type_1)
	(pred_5 ?v2 - type_4 ?v8 - type_4)
	(pred_6 ?v4 - type_2)
	(pred_3 ?v4 - type_2))                                                                                           
(:action op_2 
        :parameters (?v7 - type_4 ?v3 - type_4 ?v1 - type_5)
        :precondition (and (pred_1 ?v1 ?v7) 
                           (pred_5 ?v7 ?v3))                                                          
        :effect (and (not (pred_1 ?v1 ?v7)) (pred_1 ?v1 ?v3)))

(:action op_1 
        :parameters (?v5 - type_4 ?v6 - type_1 ?v1 - type_5)
        :precondition (and (pred_1 ?v1 ?v5) 
                           (pred_1 ?v6 ?v5))
        :effect (and (not (pred_1 ?v6 ?v5))
                     (pred_2 ?v1 ?v6)))

(:action op_3 
        :parameters (?v5 - type_4 ?v6 - type_1 ?v1 - type_5 ?v4 - type_2)
        :precondition (and (pred_1 ?v1 ?v5) 
		      	   (pred_1 ?v4 ?v5)
			   (pred_2 ?v1 ?v6)
			   (pred_4 ?v6)
			   (pred_3 ?v4))
        :effect (and (not (pred_3 ?v4))(not (pred_4 ?v6)) (pred_6 ?v4)))
)