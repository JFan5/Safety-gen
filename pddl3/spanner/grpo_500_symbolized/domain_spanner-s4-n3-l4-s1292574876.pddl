(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_4 type_2 - object
	type_5 type_1 type_3 - type_2	
)                                           
                                                                               
(:predicates 
	(pred_3 ?v2 - type_2 ?v8 - type_4)
	(pred_6 ?v2 - type_5 ?v4 - type_3)
	(pred_1 ?v4 - type_3)
	(pred_2 ?v3 - type_4 ?v7 - type_4)
	(pred_5 ?v5 - type_1)
	(pred_4 ?v5 - type_1))                                                                                           
(:action op_2 
        :parameters (?v1 - type_4 ?v6 - type_4 ?v2 - type_5)
        :precondition (and (pred_3 ?v2 ?v1) 
                           (pred_2 ?v1 ?v6))                                                          
        :effect (and (not (pred_3 ?v2 ?v1)) (pred_3 ?v2 ?v6)))

(:action op_3 
        :parameters (?v8 - type_4 ?v4 - type_3 ?v2 - type_5)
        :precondition (and (pred_3 ?v2 ?v8) 
                           (pred_3 ?v4 ?v8))
        :effect (and (not (pred_3 ?v4 ?v8))
                     (pred_6 ?v2 ?v4)))

(:action op_1 
        :parameters (?v8 - type_4 ?v4 - type_3 ?v2 - type_5 ?v5 - type_1)
        :precondition (and (pred_3 ?v2 ?v8) 
		      	   (pred_3 ?v5 ?v8)
			   (pred_6 ?v2 ?v4)
			   (pred_1 ?v4)
			   (pred_4 ?v5))
        :effect (and (not (pred_4 ?v5))(not (pred_1 ?v4)) (pred_5 ?v5)))
)