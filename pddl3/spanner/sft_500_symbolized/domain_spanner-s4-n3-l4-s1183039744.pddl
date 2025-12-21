(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_5 type_4 - object
	type_2 type_3 type_1 - type_4	
)                                           
                                                                               
(:predicates 
	(pred_2 ?v7 - type_4 ?v8 - type_5)
	(pred_6 ?v7 - type_2 ?v3 - type_1)
	(pred_1 ?v3 - type_1)
	(pred_5 ?v4 - type_5 ?v1 - type_5)
	(pred_3 ?v6 - type_3)
	(pred_4 ?v6 - type_3))                                                                                           
(:action op_2 
        :parameters (?v2 - type_5 ?v5 - type_5 ?v7 - type_2)
        :precondition (and (pred_2 ?v7 ?v2) 
                           (pred_5 ?v2 ?v5))                                                          
        :effect (and (not (pred_2 ?v7 ?v2)) (pred_2 ?v7 ?v5)))

(:action op_3 
        :parameters (?v8 - type_5 ?v3 - type_1 ?v7 - type_2)
        :precondition (and (pred_2 ?v7 ?v8) 
                           (pred_2 ?v3 ?v8))
        :effect (and (not (pred_2 ?v3 ?v8))
                     (pred_6 ?v7 ?v3)))

(:action op_1 
        :parameters (?v8 - type_5 ?v3 - type_1 ?v7 - type_2 ?v6 - type_3)
        :precondition (and (pred_2 ?v7 ?v8) 
		      	   (pred_2 ?v6 ?v8)
			   (pred_6 ?v7 ?v3)
			   (pred_1 ?v3)
			   (pred_4 ?v6))
        :effect (and (not (pred_4 ?v6))(not (pred_1 ?v3)) (pred_3 ?v6)))
)