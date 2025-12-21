(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_1 type_5 - object
	type_2 type_3 type_4 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_1 ?v1 - type_5 ?v6 - type_1)
	(pred_2 ?v1 - type_2 ?v2 - type_4)
	(pred_6 ?v2 - type_4)
	(pred_5 ?v3 - type_1 ?v4 - type_1)
	(pred_3 ?v7 - type_3)
	(pred_4 ?v7 - type_3))                                                                                           
(:action op_3 
        :parameters (?v8 - type_1 ?v5 - type_1 ?v1 - type_2)
        :precondition (and (pred_1 ?v1 ?v8) 
                           (pred_5 ?v8 ?v5))                                                          
        :effect (and (not (pred_1 ?v1 ?v8)) (pred_1 ?v1 ?v5)))

(:action op_2 
        :parameters (?v6 - type_1 ?v2 - type_4 ?v1 - type_2)
        :precondition (and (pred_1 ?v1 ?v6) 
                           (pred_1 ?v2 ?v6))
        :effect (and (not (pred_1 ?v2 ?v6))
                     (pred_2 ?v1 ?v2)))

(:action op_1 
        :parameters (?v6 - type_1 ?v2 - type_4 ?v1 - type_2 ?v7 - type_3)
        :precondition (and (pred_1 ?v1 ?v6) 
		      	   (pred_1 ?v7 ?v6)
			   (pred_2 ?v1 ?v2)
			   (pred_6 ?v2)
			   (pred_4 ?v7))
        :effect (and (not (pred_4 ?v7))(not (pred_6 ?v2)) (pred_3 ?v7)))
)