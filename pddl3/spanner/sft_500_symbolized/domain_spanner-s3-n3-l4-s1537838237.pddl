(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_2 type_1 - object
	type_4 type_3 type_5 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_4 ?v6 - type_1 ?v2 - type_2)
	(pred_5 ?v6 - type_4 ?v7 - type_5)
	(pred_3 ?v7 - type_5)
	(pred_1 ?v4 - type_2 ?v8 - type_2)
	(pred_2 ?v5 - type_3)
	(pred_6 ?v5 - type_3))                                                                                           
(:action op_1 
        :parameters (?v3 - type_2 ?v1 - type_2 ?v6 - type_4)
        :precondition (and (pred_4 ?v6 ?v3) 
                           (pred_1 ?v3 ?v1))                                                          
        :effect (and (not (pred_4 ?v6 ?v3)) (pred_4 ?v6 ?v1)))

(:action op_3 
        :parameters (?v2 - type_2 ?v7 - type_5 ?v6 - type_4)
        :precondition (and (pred_4 ?v6 ?v2) 
                           (pred_4 ?v7 ?v2))
        :effect (and (not (pred_4 ?v7 ?v2))
                     (pred_5 ?v6 ?v7)))

(:action op_2 
        :parameters (?v2 - type_2 ?v7 - type_5 ?v6 - type_4 ?v5 - type_3)
        :precondition (and (pred_4 ?v6 ?v2) 
		      	   (pred_4 ?v5 ?v2)
			   (pred_5 ?v6 ?v7)
			   (pred_3 ?v7)
			   (pred_6 ?v5))
        :effect (and (not (pred_6 ?v5))(not (pred_3 ?v7)) (pred_2 ?v5)))
)