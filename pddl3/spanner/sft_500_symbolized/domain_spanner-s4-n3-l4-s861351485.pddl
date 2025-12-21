(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_1 type_5 - object
	type_4 type_2 type_3 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_5 ?v5 - type_5 ?v6 - type_1)
	(pred_2 ?v5 - type_4 ?v3 - type_3)
	(pred_3 ?v3 - type_3)
	(pred_1 ?v4 - type_1 ?v1 - type_1)
	(pred_6 ?v8 - type_2)
	(pred_4 ?v8 - type_2))                                                                                           
(:action op_1 
        :parameters (?v2 - type_1 ?v7 - type_1 ?v5 - type_4)
        :precondition (and (pred_5 ?v5 ?v2) 
                           (pred_1 ?v2 ?v7))                                                          
        :effect (and (not (pred_5 ?v5 ?v2)) (pred_5 ?v5 ?v7)))

(:action op_2 
        :parameters (?v6 - type_1 ?v3 - type_3 ?v5 - type_4)
        :precondition (and (pred_5 ?v5 ?v6) 
                           (pred_5 ?v3 ?v6))
        :effect (and (not (pred_5 ?v3 ?v6))
                     (pred_2 ?v5 ?v3)))

(:action op_3 
        :parameters (?v6 - type_1 ?v3 - type_3 ?v5 - type_4 ?v8 - type_2)
        :precondition (and (pred_5 ?v5 ?v6) 
		      	   (pred_5 ?v8 ?v6)
			   (pred_2 ?v5 ?v3)
			   (pred_3 ?v3)
			   (pred_4 ?v8))
        :effect (and (not (pred_4 ?v8))(not (pred_3 ?v3)) (pred_6 ?v8)))
)