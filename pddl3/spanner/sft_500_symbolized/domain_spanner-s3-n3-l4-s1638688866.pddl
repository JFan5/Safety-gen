(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_4 type_5 - object
	type_3 type_1 type_2 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_5 ?v8 - type_5 ?v5 - type_4)
	(pred_2 ?v8 - type_3 ?v1 - type_2)
	(pred_1 ?v1 - type_2)
	(pred_6 ?v4 - type_4 ?v6 - type_4)
	(pred_4 ?v3 - type_1)
	(pred_3 ?v3 - type_1))                                                                                           
(:action op_2 
        :parameters (?v2 - type_4 ?v7 - type_4 ?v8 - type_3)
        :precondition (and (pred_5 ?v8 ?v2) 
                           (pred_6 ?v2 ?v7))                                                          
        :effect (and (not (pred_5 ?v8 ?v2)) (pred_5 ?v8 ?v7)))

(:action op_3 
        :parameters (?v5 - type_4 ?v1 - type_2 ?v8 - type_3)
        :precondition (and (pred_5 ?v8 ?v5) 
                           (pred_5 ?v1 ?v5))
        :effect (and (not (pred_5 ?v1 ?v5))
                     (pred_2 ?v8 ?v1)))

(:action op_1 
        :parameters (?v5 - type_4 ?v1 - type_2 ?v8 - type_3 ?v3 - type_1)
        :precondition (and (pred_5 ?v8 ?v5) 
		      	   (pred_5 ?v3 ?v5)
			   (pred_2 ?v8 ?v1)
			   (pred_1 ?v1)
			   (pred_3 ?v3))
        :effect (and (not (pred_3 ?v3))(not (pred_1 ?v1)) (pred_4 ?v3)))
)