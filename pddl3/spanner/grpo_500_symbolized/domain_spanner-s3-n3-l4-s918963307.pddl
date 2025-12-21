(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_5 - object
	type_1 type_2 type_4 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_1 ?v4 - type_5 ?v7 - type_3)
	(pred_2 ?v4 - type_1 ?v8 - type_4)
	(pred_5 ?v8 - type_4)
	(pred_4 ?v1 - type_3 ?v6 - type_3)
	(pred_6 ?v2 - type_2)
	(pred_3 ?v2 - type_2))                                                                                           
(:action op_2 
        :parameters (?v5 - type_3 ?v3 - type_3 ?v4 - type_1)
        :precondition (and (pred_1 ?v4 ?v5) 
                           (pred_4 ?v5 ?v3))                                                          
        :effect (and (not (pred_1 ?v4 ?v5)) (pred_1 ?v4 ?v3)))

(:action op_1 
        :parameters (?v7 - type_3 ?v8 - type_4 ?v4 - type_1)
        :precondition (and (pred_1 ?v4 ?v7) 
                           (pred_1 ?v8 ?v7))
        :effect (and (not (pred_1 ?v8 ?v7))
                     (pred_2 ?v4 ?v8)))

(:action op_3 
        :parameters (?v7 - type_3 ?v8 - type_4 ?v4 - type_1 ?v2 - type_2)
        :precondition (and (pred_1 ?v4 ?v7) 
		      	   (pred_1 ?v2 ?v7)
			   (pred_2 ?v4 ?v8)
			   (pred_5 ?v8)
			   (pred_3 ?v2))
        :effect (and (not (pred_3 ?v2))(not (pred_5 ?v8)) (pred_6 ?v2)))
)