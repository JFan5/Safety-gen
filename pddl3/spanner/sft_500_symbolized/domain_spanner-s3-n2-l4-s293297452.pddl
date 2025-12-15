(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_5 type_2 - object
	type_3 type_4 type_1 - type_2	
)                                           
                                                                               
(:predicates 
	(pred_1 ?v1 - type_2 ?v5 - type_5)
	(pred_5 ?v1 - type_3 ?v8 - type_1)
	(pred_2 ?v8 - type_1)
	(pred_3 ?v7 - type_5 ?v6 - type_5)
	(pred_4 ?v3 - type_4)
	(pred_6 ?v3 - type_4))                                                                                           
(:action op_2 
        :parameters (?v2 - type_5 ?v4 - type_5 ?v1 - type_3)
        :precondition (and (pred_1 ?v1 ?v2) 
                           (pred_3 ?v2 ?v4))                                                          
        :effect (and (not (pred_1 ?v1 ?v2)) (pred_1 ?v1 ?v4)))

(:action op_3 
        :parameters (?v5 - type_5 ?v8 - type_1 ?v1 - type_3)
        :precondition (and (pred_1 ?v1 ?v5) 
                           (pred_1 ?v8 ?v5))
        :effect (and (not (pred_1 ?v8 ?v5))
                     (pred_5 ?v1 ?v8)))

(:action op_1 
        :parameters (?v5 - type_5 ?v8 - type_1 ?v1 - type_3 ?v3 - type_4)
        :precondition (and (pred_1 ?v1 ?v5) 
		      	   (pred_1 ?v3 ?v5)
			   (pred_5 ?v1 ?v8)
			   (pred_2 ?v8)
			   (pred_6 ?v3))
        :effect (and (not (pred_6 ?v3))(not (pred_2 ?v8)) (pred_4 ?v3)))
)