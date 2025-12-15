(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_2 type_3 - object
	type_1 type_5 type_4 - type_3	
)                                           
                                                                               
(:predicates 
	(pred_5 ?v6 - type_3 ?v8 - type_2)
	(pred_2 ?v6 - type_1 ?v7 - type_4)
	(pred_1 ?v7 - type_4)
	(pred_3 ?v5 - type_2 ?v4 - type_2)
	(pred_4 ?v3 - type_5)
	(pred_6 ?v3 - type_5))                                                                                           
(:action op_1 
        :parameters (?v2 - type_2 ?v1 - type_2 ?v6 - type_1)
        :precondition (and (pred_5 ?v6 ?v2) 
                           (pred_3 ?v2 ?v1))                                                          
        :effect (and (not (pred_5 ?v6 ?v2)) (pred_5 ?v6 ?v1)))

(:action op_2 
        :parameters (?v8 - type_2 ?v7 - type_4 ?v6 - type_1)
        :precondition (and (pred_5 ?v6 ?v8) 
                           (pred_5 ?v7 ?v8))
        :effect (and (not (pred_5 ?v7 ?v8))
                     (pred_2 ?v6 ?v7)))

(:action op_3 
        :parameters (?v8 - type_2 ?v7 - type_4 ?v6 - type_1 ?v3 - type_5)
        :precondition (and (pred_5 ?v6 ?v8) 
		      	   (pred_5 ?v3 ?v8)
			   (pred_2 ?v6 ?v7)
			   (pred_1 ?v7)
			   (pred_6 ?v3))
        :effect (and (not (pred_6 ?v3))(not (pred_1 ?v7)) (pred_4 ?v3)))
)