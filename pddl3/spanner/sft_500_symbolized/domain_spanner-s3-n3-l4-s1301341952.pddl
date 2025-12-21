(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_5 type_3 - object
	type_2 type_1 type_4 - type_3	
)                                           
                                                                               
(:predicates 
	(pred_4 ?v1 - type_3 ?v2 - type_5)
	(pred_5 ?v1 - type_2 ?v8 - type_4)
	(pred_6 ?v8 - type_4)
	(pred_1 ?v7 - type_5 ?v6 - type_5)
	(pred_3 ?v3 - type_1)
	(pred_2 ?v3 - type_1))                                                                                           
(:action op_3 
        :parameters (?v5 - type_5 ?v4 - type_5 ?v1 - type_2)
        :precondition (and (pred_4 ?v1 ?v5) 
                           (pred_1 ?v5 ?v4))                                                          
        :effect (and (not (pred_4 ?v1 ?v5)) (pred_4 ?v1 ?v4)))

(:action op_1 
        :parameters (?v2 - type_5 ?v8 - type_4 ?v1 - type_2)
        :precondition (and (pred_4 ?v1 ?v2) 
                           (pred_4 ?v8 ?v2))
        :effect (and (not (pred_4 ?v8 ?v2))
                     (pred_5 ?v1 ?v8)))

(:action op_2 
        :parameters (?v2 - type_5 ?v8 - type_4 ?v1 - type_2 ?v3 - type_1)
        :precondition (and (pred_4 ?v1 ?v2) 
		      	   (pred_4 ?v3 ?v2)
			   (pred_5 ?v1 ?v8)
			   (pred_6 ?v8)
			   (pred_2 ?v3))
        :effect (and (not (pred_2 ?v3))(not (pred_6 ?v8)) (pred_3 ?v3)))
)