(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_1 type_4 - object
	type_2 type_3 type_5 - type_4	
)                                           
                                                                               
(:predicates 
	(pred_1 ?v5 - type_4 ?v1 - type_1)
	(pred_2 ?v5 - type_2 ?v8 - type_5)
	(pred_5 ?v8 - type_5)
	(pred_3 ?v4 - type_1 ?v2 - type_1)
	(pred_6 ?v6 - type_3)
	(pred_4 ?v6 - type_3))                                                                                           
(:action op_1 
        :parameters (?v7 - type_1 ?v3 - type_1 ?v5 - type_2)
        :precondition (and (pred_1 ?v5 ?v7) 
                           (pred_3 ?v7 ?v3))                                                          
        :effect (and (not (pred_1 ?v5 ?v7)) (pred_1 ?v5 ?v3)))

(:action op_2 
        :parameters (?v1 - type_1 ?v8 - type_5 ?v5 - type_2)
        :precondition (and (pred_1 ?v5 ?v1) 
                           (pred_1 ?v8 ?v1))
        :effect (and (not (pred_1 ?v8 ?v1))
                     (pred_2 ?v5 ?v8)))

(:action op_3 
        :parameters (?v1 - type_1 ?v8 - type_5 ?v5 - type_2 ?v6 - type_3)
        :precondition (and (pred_1 ?v5 ?v1) 
		      	   (pred_1 ?v6 ?v1)
			   (pred_2 ?v5 ?v8)
			   (pred_5 ?v8)
			   (pred_4 ?v6))
        :effect (and (not (pred_4 ?v6))(not (pred_5 ?v8)) (pred_6 ?v6)))
)