(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_4 - object
	type_2 type_1 type_5 - type_4	
)                                           
                                                                               
(:predicates 
	(pred_6 ?v7 - type_4 ?v8 - type_3)
	(pred_2 ?v7 - type_2 ?v2 - type_5)
	(pred_3 ?v2 - type_5)
	(pred_5 ?v1 - type_3 ?v5 - type_3)
	(pred_1 ?v6 - type_1)
	(pred_4 ?v6 - type_1))                                                                                           
(:action op_1 
        :parameters (?v4 - type_3 ?v3 - type_3 ?v7 - type_2)
        :precondition (and (pred_6 ?v7 ?v4) 
                           (pred_5 ?v4 ?v3))                                                          
        :effect (and (not (pred_6 ?v7 ?v4)) (pred_6 ?v7 ?v3)))

(:action op_3 
        :parameters (?v8 - type_3 ?v2 - type_5 ?v7 - type_2)
        :precondition (and (pred_6 ?v7 ?v8) 
                           (pred_6 ?v2 ?v8))
        :effect (and (not (pred_6 ?v2 ?v8))
                     (pred_2 ?v7 ?v2)))

(:action op_2 
        :parameters (?v8 - type_3 ?v2 - type_5 ?v7 - type_2 ?v6 - type_1)
        :precondition (and (pred_6 ?v7 ?v8) 
		      	   (pred_6 ?v6 ?v8)
			   (pred_2 ?v7 ?v2)
			   (pred_3 ?v2)
			   (pred_4 ?v6))
        :effect (and (not (pred_4 ?v6))(not (pred_3 ?v2)) (pred_1 ?v6)))
)