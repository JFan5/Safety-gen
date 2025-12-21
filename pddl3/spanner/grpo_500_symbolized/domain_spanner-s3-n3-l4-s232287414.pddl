(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_1 type_5 - object
	type_4 type_2 type_3 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_6 ?v4 - type_5 ?v7 - type_1)
	(pred_2 ?v4 - type_4 ?v1 - type_3)
	(pred_3 ?v1 - type_3)
	(pred_5 ?v3 - type_1 ?v5 - type_1)
	(pred_4 ?v8 - type_2)
	(pred_1 ?v8 - type_2))                                                                                           
(:action op_1 
        :parameters (?v2 - type_1 ?v6 - type_1 ?v4 - type_4)
        :precondition (and (pred_6 ?v4 ?v2) 
                           (pred_5 ?v2 ?v6))                                                          
        :effect (and (not (pred_6 ?v4 ?v2)) (pred_6 ?v4 ?v6)))

(:action op_2 
        :parameters (?v7 - type_1 ?v1 - type_3 ?v4 - type_4)
        :precondition (and (pred_6 ?v4 ?v7) 
                           (pred_6 ?v1 ?v7))
        :effect (and (not (pred_6 ?v1 ?v7))
                     (pred_2 ?v4 ?v1)))

(:action op_3 
        :parameters (?v7 - type_1 ?v1 - type_3 ?v4 - type_4 ?v8 - type_2)
        :precondition (and (pred_6 ?v4 ?v7) 
		      	   (pred_6 ?v8 ?v7)
			   (pred_2 ?v4 ?v1)
			   (pred_3 ?v1)
			   (pred_1 ?v8))
        :effect (and (not (pred_1 ?v8))(not (pred_3 ?v1)) (pred_4 ?v8)))
)