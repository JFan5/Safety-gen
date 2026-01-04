(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_1 - object
	type_2 type_5 type_4 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_1 ?v4 - type_1 ?v1 - type_3)
	(pred_4 ?v4 - type_2 ?v8 - type_4)
	(pred_6 ?v8 - type_4)
	(pred_5 ?v7 - type_3 ?v6 - type_3)
	(pred_3 ?v3 - type_5)
	(pred_2 ?v3 - type_5))                                                                                           
(:action op_1 
        :parameters (?v2 - type_3 ?v5 - type_3 ?v4 - type_2)
        :precondition (and (pred_1 ?v4 ?v2) 
                           (pred_5 ?v2 ?v5))                                                          
        :effect (and (not (pred_1 ?v4 ?v2)) (pred_1 ?v4 ?v5)))

(:action op_2 
        :parameters (?v1 - type_3 ?v8 - type_4 ?v4 - type_2)
        :precondition (and (pred_1 ?v4 ?v1) 
                           (pred_1 ?v8 ?v1))
        :effect (and (not (pred_1 ?v8 ?v1))
                     (pred_4 ?v4 ?v8)))

(:action op_3 
        :parameters (?v1 - type_3 ?v8 - type_4 ?v4 - type_2 ?v3 - type_5)
        :precondition (and (pred_1 ?v4 ?v1) 
		      	   (pred_1 ?v3 ?v1)
			   (pred_4 ?v4 ?v8)
			   (pred_6 ?v8)
			   (pred_2 ?v3))
        :effect (and (not (pred_2 ?v3))(not (pred_6 ?v8)) (pred_3 ?v3)))
)