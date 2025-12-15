(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_5 type_1 - object
	type_2 type_4 type_3 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_2 ?v3 - type_1 ?v1 - type_5)
	(pred_5 ?v3 - type_2 ?v8 - type_3)
	(pred_3 ?v8 - type_3)
	(pred_4 ?v4 - type_5 ?v5 - type_5)
	(pred_6 ?v2 - type_4)
	(pred_1 ?v2 - type_4))                                                                                           
(:action op_3 
        :parameters (?v7 - type_5 ?v6 - type_5 ?v3 - type_2)
        :precondition (and (pred_2 ?v3 ?v7) 
                           (pred_4 ?v7 ?v6))                                                          
        :effect (and (not (pred_2 ?v3 ?v7)) (pred_2 ?v3 ?v6)))

(:action op_2 
        :parameters (?v1 - type_5 ?v8 - type_3 ?v3 - type_2)
        :precondition (and (pred_2 ?v3 ?v1) 
                           (pred_2 ?v8 ?v1))
        :effect (and (not (pred_2 ?v8 ?v1))
                     (pred_5 ?v3 ?v8)))

(:action op_1 
        :parameters (?v1 - type_5 ?v8 - type_3 ?v3 - type_2 ?v2 - type_4)
        :precondition (and (pred_2 ?v3 ?v1) 
		      	   (pred_2 ?v2 ?v1)
			   (pred_5 ?v3 ?v8)
			   (pred_3 ?v8)
			   (pred_1 ?v2))
        :effect (and (not (pred_1 ?v2))(not (pred_3 ?v8)) (pred_6 ?v2)))
)