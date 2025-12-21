(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_5 type_3 - object
	type_4 type_1 type_2 - type_3	
)                                           
                                                                               
(:predicates 
	(pred_4 ?v2 - type_3 ?v8 - type_5)
	(pred_3 ?v2 - type_4 ?v3 - type_2)
	(pred_1 ?v3 - type_2)
	(pred_6 ?v7 - type_5 ?v6 - type_5)
	(pred_2 ?v4 - type_1)
	(pred_5 ?v4 - type_1))                                                                                           
(:action op_1 
        :parameters (?v1 - type_5 ?v5 - type_5 ?v2 - type_4)
        :precondition (and (pred_4 ?v2 ?v1) 
                           (pred_6 ?v1 ?v5))                                                          
        :effect (and (not (pred_4 ?v2 ?v1)) (pred_4 ?v2 ?v5)))

(:action op_3 
        :parameters (?v8 - type_5 ?v3 - type_2 ?v2 - type_4)
        :precondition (and (pred_4 ?v2 ?v8) 
                           (pred_4 ?v3 ?v8))
        :effect (and (not (pred_4 ?v3 ?v8))
                     (pred_3 ?v2 ?v3)))

(:action op_2 
        :parameters (?v8 - type_5 ?v3 - type_2 ?v2 - type_4 ?v4 - type_1)
        :precondition (and (pred_4 ?v2 ?v8) 
		      	   (pred_4 ?v4 ?v8)
			   (pred_3 ?v2 ?v3)
			   (pred_1 ?v3)
			   (pred_5 ?v4))
        :effect (and (not (pred_5 ?v4))(not (pred_1 ?v3)) (pred_2 ?v4)))
)