(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_1 type_5 - object
	type_2 type_3 type_4 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_4 ?v4 - type_5 ?v8 - type_1)
	(pred_2 ?v4 - type_2 ?v2 - type_4)
	(pred_1 ?v2 - type_4)
	(pred_6 ?v6 - type_1 ?v5 - type_1)
	(pred_5 ?v1 - type_3)
	(pred_3 ?v1 - type_3))                                                                                           
(:action op_1 
        :parameters (?v7 - type_1 ?v3 - type_1 ?v4 - type_2)
        :precondition (and (pred_4 ?v4 ?v7) 
                           (pred_6 ?v7 ?v3))                                                          
        :effect (and (not (pred_4 ?v4 ?v7)) (pred_4 ?v4 ?v3)))

(:action op_3 
        :parameters (?v8 - type_1 ?v2 - type_4 ?v4 - type_2)
        :precondition (and (pred_4 ?v4 ?v8) 
                           (pred_4 ?v2 ?v8))
        :effect (and (not (pred_4 ?v2 ?v8))
                     (pred_2 ?v4 ?v2)))

(:action op_2 
        :parameters (?v8 - type_1 ?v2 - type_4 ?v4 - type_2 ?v1 - type_3)
        :precondition (and (pred_4 ?v4 ?v8) 
		      	   (pred_4 ?v1 ?v8)
			   (pred_2 ?v4 ?v2)
			   (pred_1 ?v2)
			   (pred_3 ?v1))
        :effect (and (not (pred_3 ?v1))(not (pred_1 ?v2)) (pred_5 ?v1)))
)