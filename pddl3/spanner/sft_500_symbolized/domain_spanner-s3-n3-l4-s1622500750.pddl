(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_5 type_3 - object
	type_2 type_4 type_1 - type_3	
)                                           
                                                                               
(:predicates 
	(pred_4 ?v5 - type_3 ?v7 - type_5)
	(pred_2 ?v5 - type_2 ?v8 - type_1)
	(pred_1 ?v8 - type_1)
	(pred_6 ?v4 - type_5 ?v1 - type_5)
	(pred_3 ?v2 - type_4)
	(pred_5 ?v2 - type_4))                                                                                           
(:action op_2 
        :parameters (?v6 - type_5 ?v3 - type_5 ?v5 - type_2)
        :precondition (and (pred_4 ?v5 ?v6) 
                           (pred_6 ?v6 ?v3))                                                          
        :effect (and (not (pred_4 ?v5 ?v6)) (pred_4 ?v5 ?v3)))

(:action op_3 
        :parameters (?v7 - type_5 ?v8 - type_1 ?v5 - type_2)
        :precondition (and (pred_4 ?v5 ?v7) 
                           (pred_4 ?v8 ?v7))
        :effect (and (not (pred_4 ?v8 ?v7))
                     (pred_2 ?v5 ?v8)))

(:action op_1 
        :parameters (?v7 - type_5 ?v8 - type_1 ?v5 - type_2 ?v2 - type_4)
        :precondition (and (pred_4 ?v5 ?v7) 
		      	   (pred_4 ?v2 ?v7)
			   (pred_2 ?v5 ?v8)
			   (pred_1 ?v8)
			   (pred_5 ?v2))
        :effect (and (not (pred_5 ?v2))(not (pred_1 ?v8)) (pred_3 ?v2)))
)