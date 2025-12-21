(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_5 type_3 - object
	type_2 type_1 type_4 - type_3	
)                                           
                                                                               
(:predicates 
	(pred_3 ?v1 - type_3 ?v8 - type_5)
	(pred_2 ?v1 - type_2 ?v5 - type_4)
	(pred_6 ?v5 - type_4)
	(pred_1 ?v3 - type_5 ?v2 - type_5)
	(pred_5 ?v7 - type_1)
	(pred_4 ?v7 - type_1))                                                                                           
(:action op_3 
        :parameters (?v4 - type_5 ?v6 - type_5 ?v1 - type_2)
        :precondition (and (pred_3 ?v1 ?v4) 
                           (pred_1 ?v4 ?v6))                                                          
        :effect (and (not (pred_3 ?v1 ?v4)) (pred_3 ?v1 ?v6)))

(:action op_2 
        :parameters (?v8 - type_5 ?v5 - type_4 ?v1 - type_2)
        :precondition (and (pred_3 ?v1 ?v8) 
                           (pred_3 ?v5 ?v8))
        :effect (and (not (pred_3 ?v5 ?v8))
                     (pred_2 ?v1 ?v5)))

(:action op_1 
        :parameters (?v8 - type_5 ?v5 - type_4 ?v1 - type_2 ?v7 - type_1)
        :precondition (and (pred_3 ?v1 ?v8) 
		      	   (pred_3 ?v7 ?v8)
			   (pred_2 ?v1 ?v5)
			   (pred_6 ?v5)
			   (pred_4 ?v7))
        :effect (and (not (pred_4 ?v7))(not (pred_6 ?v5)) (pred_5 ?v7)))
)