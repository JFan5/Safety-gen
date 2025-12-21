(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_5 - object
	type_1 type_4 type_2 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_2 ?v4 - type_5 ?v7 - type_3)
	(pred_4 ?v4 - type_1 ?v3 - type_2)
	(pred_1 ?v3 - type_2)
	(pred_5 ?v5 - type_3 ?v1 - type_3)
	(pred_6 ?v2 - type_4)
	(pred_3 ?v2 - type_4))                                                                                           
(:action op_2 
        :parameters (?v8 - type_3 ?v6 - type_3 ?v4 - type_1)
        :precondition (and (pred_2 ?v4 ?v8) 
                           (pred_5 ?v8 ?v6))                                                          
        :effect (and (not (pred_2 ?v4 ?v8)) (pred_2 ?v4 ?v6)))

(:action op_3 
        :parameters (?v7 - type_3 ?v3 - type_2 ?v4 - type_1)
        :precondition (and (pred_2 ?v4 ?v7) 
                           (pred_2 ?v3 ?v7))
        :effect (and (not (pred_2 ?v3 ?v7))
                     (pred_4 ?v4 ?v3)))

(:action op_1 
        :parameters (?v7 - type_3 ?v3 - type_2 ?v4 - type_1 ?v2 - type_4)
        :precondition (and (pred_2 ?v4 ?v7) 
		      	   (pred_2 ?v2 ?v7)
			   (pred_4 ?v4 ?v3)
			   (pred_1 ?v3)
			   (pred_3 ?v2))
        :effect (and (not (pred_3 ?v2))(not (pred_1 ?v3)) (pred_6 ?v2)))
)