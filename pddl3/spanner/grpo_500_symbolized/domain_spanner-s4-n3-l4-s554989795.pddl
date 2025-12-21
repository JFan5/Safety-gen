(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_4 - object
	type_2 type_5 type_1 - type_4	
)                                           
                                                                               
(:predicates 
	(pred_5 ?v8 - type_4 ?v3 - type_3)
	(pred_6 ?v8 - type_2 ?v5 - type_1)
	(pred_1 ?v5 - type_1)
	(pred_2 ?v6 - type_3 ?v2 - type_3)
	(pred_4 ?v1 - type_5)
	(pred_3 ?v1 - type_5))                                                                                           
(:action op_3 
        :parameters (?v7 - type_3 ?v4 - type_3 ?v8 - type_2)
        :precondition (and (pred_5 ?v8 ?v7) 
                           (pred_2 ?v7 ?v4))                                                          
        :effect (and (not (pred_5 ?v8 ?v7)) (pred_5 ?v8 ?v4)))

(:action op_2 
        :parameters (?v3 - type_3 ?v5 - type_1 ?v8 - type_2)
        :precondition (and (pred_5 ?v8 ?v3) 
                           (pred_5 ?v5 ?v3))
        :effect (and (not (pred_5 ?v5 ?v3))
                     (pred_6 ?v8 ?v5)))

(:action op_1 
        :parameters (?v3 - type_3 ?v5 - type_1 ?v8 - type_2 ?v1 - type_5)
        :precondition (and (pred_5 ?v8 ?v3) 
		      	   (pred_5 ?v1 ?v3)
			   (pred_6 ?v8 ?v5)
			   (pred_1 ?v5)
			   (pred_3 ?v1))
        :effect (and (not (pred_3 ?v1))(not (pred_1 ?v5)) (pred_4 ?v1)))
)