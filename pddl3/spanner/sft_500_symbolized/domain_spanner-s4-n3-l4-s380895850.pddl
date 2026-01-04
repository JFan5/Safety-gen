(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_4 type_5 - object
	type_2 type_3 type_1 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_3 ?v3 - type_5 ?v4 - type_4)
	(pred_2 ?v3 - type_2 ?v1 - type_1)
	(pred_5 ?v1 - type_1)
	(pred_1 ?v5 - type_4 ?v2 - type_4)
	(pred_6 ?v7 - type_3)
	(pred_4 ?v7 - type_3))                                                                                           
(:action op_2 
        :parameters (?v8 - type_4 ?v6 - type_4 ?v3 - type_2)
        :precondition (and (pred_3 ?v3 ?v8) 
                           (pred_1 ?v8 ?v6))                                                          
        :effect (and (not (pred_3 ?v3 ?v8)) (pred_3 ?v3 ?v6)))

(:action op_3 
        :parameters (?v4 - type_4 ?v1 - type_1 ?v3 - type_2)
        :precondition (and (pred_3 ?v3 ?v4) 
                           (pred_3 ?v1 ?v4))
        :effect (and (not (pred_3 ?v1 ?v4))
                     (pred_2 ?v3 ?v1)))

(:action op_1 
        :parameters (?v4 - type_4 ?v1 - type_1 ?v3 - type_2 ?v7 - type_3)
        :precondition (and (pred_3 ?v3 ?v4) 
		      	   (pred_3 ?v7 ?v4)
			   (pred_2 ?v3 ?v1)
			   (pred_5 ?v1)
			   (pred_4 ?v7))
        :effect (and (not (pred_4 ?v7))(not (pred_5 ?v1)) (pred_6 ?v7)))
)