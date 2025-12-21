(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_4 type_1 - object
	type_2 type_5 type_3 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_1 ?v5 - type_1 ?v3 - type_4)
	(pred_6 ?v5 - type_2 ?v1 - type_3)
	(pred_2 ?v1 - type_3)
	(pred_4 ?v2 - type_4 ?v4 - type_4)
	(pred_3 ?v8 - type_5)
	(pred_5 ?v8 - type_5))                                                                                           
(:action op_3 
        :parameters (?v7 - type_4 ?v6 - type_4 ?v5 - type_2)
        :precondition (and (pred_1 ?v5 ?v7) 
                           (pred_4 ?v7 ?v6))                                                          
        :effect (and (not (pred_1 ?v5 ?v7)) (pred_1 ?v5 ?v6)))

(:action op_2 
        :parameters (?v3 - type_4 ?v1 - type_3 ?v5 - type_2)
        :precondition (and (pred_1 ?v5 ?v3) 
                           (pred_1 ?v1 ?v3))
        :effect (and (not (pred_1 ?v1 ?v3))
                     (pred_6 ?v5 ?v1)))

(:action op_1 
        :parameters (?v3 - type_4 ?v1 - type_3 ?v5 - type_2 ?v8 - type_5)
        :precondition (and (pred_1 ?v5 ?v3) 
		      	   (pred_1 ?v8 ?v3)
			   (pred_6 ?v5 ?v1)
			   (pred_2 ?v1)
			   (pred_5 ?v8))
        :effect (and (not (pred_5 ?v8))(not (pred_2 ?v1)) (pred_3 ?v8)))
)