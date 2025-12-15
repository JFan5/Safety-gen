(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_5 type_2 - object
	type_3 type_4 type_1 - type_2	
)                                           
                                                                               
(:predicates 
	(pred_5 ?v8 - type_2 ?v3 - type_5)
	(pred_2 ?v8 - type_3 ?v1 - type_1)
	(pred_6 ?v1 - type_1)
	(pred_3 ?v5 - type_5 ?v6 - type_5)
	(pred_1 ?v4 - type_4)
	(pred_4 ?v4 - type_4))                                                                                           
(:action op_1 
        :parameters (?v2 - type_5 ?v7 - type_5 ?v8 - type_3)
        :precondition (and (pred_5 ?v8 ?v2) 
                           (pred_3 ?v2 ?v7))                                                          
        :effect (and (not (pred_5 ?v8 ?v2)) (pred_5 ?v8 ?v7)))

(:action op_3 
        :parameters (?v3 - type_5 ?v1 - type_1 ?v8 - type_3)
        :precondition (and (pred_5 ?v8 ?v3) 
                           (pred_5 ?v1 ?v3))
        :effect (and (not (pred_5 ?v1 ?v3))
                     (pred_2 ?v8 ?v1)))

(:action op_2 
        :parameters (?v3 - type_5 ?v1 - type_1 ?v8 - type_3 ?v4 - type_4)
        :precondition (and (pred_5 ?v8 ?v3) 
		      	   (pred_5 ?v4 ?v3)
			   (pred_2 ?v8 ?v1)
			   (pred_6 ?v1)
			   (pred_4 ?v4))
        :effect (and (not (pred_4 ?v4))(not (pred_6 ?v1)) (pred_1 ?v4)))
)