(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_1 type_4 - object
	type_5 type_3 type_2 - type_4	
)                                           
                                                                               
(:predicates 
	(pred_3 ?v1 - type_4 ?v8 - type_1)
	(pred_5 ?v1 - type_5 ?v4 - type_2)
	(pred_6 ?v4 - type_2)
	(pred_2 ?v2 - type_1 ?v7 - type_1)
	(pred_4 ?v3 - type_3)
	(pred_1 ?v3 - type_3))                                                                                           
(:action op_1 
        :parameters (?v5 - type_1 ?v6 - type_1 ?v1 - type_5)
        :precondition (and (pred_3 ?v1 ?v5) 
                           (pred_2 ?v5 ?v6))                                                          
        :effect (and (not (pred_3 ?v1 ?v5)) (pred_3 ?v1 ?v6)))

(:action op_2 
        :parameters (?v8 - type_1 ?v4 - type_2 ?v1 - type_5)
        :precondition (and (pred_3 ?v1 ?v8) 
                           (pred_3 ?v4 ?v8))
        :effect (and (not (pred_3 ?v4 ?v8))
                     (pred_5 ?v1 ?v4)))

(:action op_3 
        :parameters (?v8 - type_1 ?v4 - type_2 ?v1 - type_5 ?v3 - type_3)
        :precondition (and (pred_3 ?v1 ?v8) 
		      	   (pred_3 ?v3 ?v8)
			   (pred_5 ?v1 ?v4)
			   (pred_6 ?v4)
			   (pred_1 ?v3))
        :effect (and (not (pred_1 ?v3))(not (pred_6 ?v4)) (pred_4 ?v3)))
)