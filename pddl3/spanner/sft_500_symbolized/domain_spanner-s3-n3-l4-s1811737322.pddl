(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_2 - object
	type_4 type_1 type_5 - type_2	
)                                           
                                                                               
(:predicates 
	(pred_5 ?v1 - type_2 ?v5 - type_3)
	(pred_1 ?v1 - type_4 ?v8 - type_5)
	(pred_4 ?v8 - type_5)
	(pred_6 ?v4 - type_3 ?v6 - type_3)
	(pred_2 ?v2 - type_1)
	(pred_3 ?v2 - type_1))                                                                                           
(:action op_1 
        :parameters (?v3 - type_3 ?v7 - type_3 ?v1 - type_4)
        :precondition (and (pred_5 ?v1 ?v3) 
                           (pred_6 ?v3 ?v7))                                                          
        :effect (and (not (pred_5 ?v1 ?v3)) (pred_5 ?v1 ?v7)))

(:action op_2 
        :parameters (?v5 - type_3 ?v8 - type_5 ?v1 - type_4)
        :precondition (and (pred_5 ?v1 ?v5) 
                           (pred_5 ?v8 ?v5))
        :effect (and (not (pred_5 ?v8 ?v5))
                     (pred_1 ?v1 ?v8)))

(:action op_3 
        :parameters (?v5 - type_3 ?v8 - type_5 ?v1 - type_4 ?v2 - type_1)
        :precondition (and (pred_5 ?v1 ?v5) 
		      	   (pred_5 ?v2 ?v5)
			   (pred_1 ?v1 ?v8)
			   (pred_4 ?v8)
			   (pred_3 ?v2))
        :effect (and (not (pred_3 ?v2))(not (pred_4 ?v8)) (pred_2 ?v2)))
)