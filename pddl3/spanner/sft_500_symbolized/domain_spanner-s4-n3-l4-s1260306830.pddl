(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_4 type_1 - object
	type_5 type_3 type_2 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_5 ?v4 - type_1 ?v1 - type_4)
	(pred_2 ?v4 - type_5 ?v5 - type_2)
	(pred_3 ?v5 - type_2)
	(pred_1 ?v6 - type_4 ?v7 - type_4)
	(pred_6 ?v8 - type_3)
	(pred_4 ?v8 - type_3))                                                                                           
(:action op_2 
        :parameters (?v3 - type_4 ?v2 - type_4 ?v4 - type_5)
        :precondition (and (pred_5 ?v4 ?v3) 
                           (pred_1 ?v3 ?v2))                                                          
        :effect (and (not (pred_5 ?v4 ?v3)) (pred_5 ?v4 ?v2)))

(:action op_3 
        :parameters (?v1 - type_4 ?v5 - type_2 ?v4 - type_5)
        :precondition (and (pred_5 ?v4 ?v1) 
                           (pred_5 ?v5 ?v1))
        :effect (and (not (pred_5 ?v5 ?v1))
                     (pred_2 ?v4 ?v5)))

(:action op_1 
        :parameters (?v1 - type_4 ?v5 - type_2 ?v4 - type_5 ?v8 - type_3)
        :precondition (and (pred_5 ?v4 ?v1) 
		      	   (pred_5 ?v8 ?v1)
			   (pred_2 ?v4 ?v5)
			   (pred_3 ?v5)
			   (pred_4 ?v8))
        :effect (and (not (pred_4 ?v8))(not (pred_3 ?v5)) (pred_6 ?v8)))
)