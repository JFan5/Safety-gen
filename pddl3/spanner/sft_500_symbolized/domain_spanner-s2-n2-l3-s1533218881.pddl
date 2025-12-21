(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_5 - object
	type_4 type_2 type_1 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_4 ?v8 - type_5 ?v6 - type_3)
	(pred_2 ?v8 - type_4 ?v7 - type_1)
	(pred_1 ?v7 - type_1)
	(pred_5 ?v1 - type_3 ?v4 - type_3)
	(pred_6 ?v5 - type_2)
	(pred_3 ?v5 - type_2))                                                                                           
(:action op_2 
        :parameters (?v2 - type_3 ?v3 - type_3 ?v8 - type_4)
        :precondition (and (pred_4 ?v8 ?v2) 
                           (pred_5 ?v2 ?v3))                                                          
        :effect (and (not (pred_4 ?v8 ?v2)) (pred_4 ?v8 ?v3)))

(:action op_1 
        :parameters (?v6 - type_3 ?v7 - type_1 ?v8 - type_4)
        :precondition (and (pred_4 ?v8 ?v6) 
                           (pred_4 ?v7 ?v6))
        :effect (and (not (pred_4 ?v7 ?v6))
                     (pred_2 ?v8 ?v7)))

(:action op_3 
        :parameters (?v6 - type_3 ?v7 - type_1 ?v8 - type_4 ?v5 - type_2)
        :precondition (and (pred_4 ?v8 ?v6) 
		      	   (pred_4 ?v5 ?v6)
			   (pred_2 ?v8 ?v7)
			   (pred_1 ?v7)
			   (pred_3 ?v5))
        :effect (and (not (pred_3 ?v5))(not (pred_1 ?v7)) (pred_6 ?v5)))
)