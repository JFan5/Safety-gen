(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_2 - object
	type_4 type_1 type_5 - type_2	
)                                           
                                                                               
(:predicates 
	(pred_3 ?v5 - type_2 ?v6 - type_3)
	(pred_2 ?v5 - type_4 ?v7 - type_5)
	(pred_4 ?v7 - type_5)
	(pred_1 ?v4 - type_3 ?v1 - type_3)
	(pred_5 ?v3 - type_1)
	(pred_6 ?v3 - type_1))                                                                                           
(:action op_3 
        :parameters (?v2 - type_3 ?v8 - type_3 ?v5 - type_4)
        :precondition (and (pred_3 ?v5 ?v2) 
                           (pred_1 ?v2 ?v8))                                                          
        :effect (and (not (pred_3 ?v5 ?v2)) (pred_3 ?v5 ?v8)))

(:action op_1 
        :parameters (?v6 - type_3 ?v7 - type_5 ?v5 - type_4)
        :precondition (and (pred_3 ?v5 ?v6) 
                           (pred_3 ?v7 ?v6))
        :effect (and (not (pred_3 ?v7 ?v6))
                     (pred_2 ?v5 ?v7)))

(:action op_2 
        :parameters (?v6 - type_3 ?v7 - type_5 ?v5 - type_4 ?v3 - type_1)
        :precondition (and (pred_3 ?v5 ?v6) 
		      	   (pred_3 ?v3 ?v6)
			   (pred_2 ?v5 ?v7)
			   (pred_4 ?v7)
			   (pred_6 ?v3))
        :effect (and (not (pred_6 ?v3))(not (pred_4 ?v7)) (pred_5 ?v3)))
)