(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_2 type_3 - object
	type_4 type_1 type_5 - type_3	
)                                           
                                                                               
(:predicates 
	(pred_6 ?v5 - type_3 ?v4 - type_2)
	(pred_5 ?v5 - type_4 ?v1 - type_5)
	(pred_3 ?v1 - type_5)
	(pred_2 ?v2 - type_2 ?v6 - type_2)
	(pred_1 ?v3 - type_1)
	(pred_4 ?v3 - type_1))                                                                                           
(:action op_2 
        :parameters (?v8 - type_2 ?v7 - type_2 ?v5 - type_4)
        :precondition (and (pred_6 ?v5 ?v8) 
                           (pred_2 ?v8 ?v7))                                                          
        :effect (and (not (pred_6 ?v5 ?v8)) (pred_6 ?v5 ?v7)))

(:action op_3 
        :parameters (?v4 - type_2 ?v1 - type_5 ?v5 - type_4)
        :precondition (and (pred_6 ?v5 ?v4) 
                           (pred_6 ?v1 ?v4))
        :effect (and (not (pred_6 ?v1 ?v4))
                     (pred_5 ?v5 ?v1)))

(:action op_1 
        :parameters (?v4 - type_2 ?v1 - type_5 ?v5 - type_4 ?v3 - type_1)
        :precondition (and (pred_6 ?v5 ?v4) 
		      	   (pred_6 ?v3 ?v4)
			   (pred_5 ?v5 ?v1)
			   (pred_3 ?v1)
			   (pred_4 ?v3))
        :effect (and (not (pred_4 ?v3))(not (pred_3 ?v1)) (pred_1 ?v3)))
)