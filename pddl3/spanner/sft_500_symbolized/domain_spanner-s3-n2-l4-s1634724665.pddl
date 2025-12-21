(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_2 - object
	type_1 type_5 type_4 - type_2	
)                                           
                                                                               
(:predicates 
	(pred_1 ?v7 - type_2 ?v8 - type_3)
	(pred_3 ?v7 - type_1 ?v2 - type_4)
	(pred_2 ?v2 - type_4)
	(pred_6 ?v3 - type_3 ?v6 - type_3)
	(pred_5 ?v1 - type_5)
	(pred_4 ?v1 - type_5))                                                                                           
(:action op_3 
        :parameters (?v4 - type_3 ?v5 - type_3 ?v7 - type_1)
        :precondition (and (pred_1 ?v7 ?v4) 
                           (pred_6 ?v4 ?v5))                                                          
        :effect (and (not (pred_1 ?v7 ?v4)) (pred_1 ?v7 ?v5)))

(:action op_2 
        :parameters (?v8 - type_3 ?v2 - type_4 ?v7 - type_1)
        :precondition (and (pred_1 ?v7 ?v8) 
                           (pred_1 ?v2 ?v8))
        :effect (and (not (pred_1 ?v2 ?v8))
                     (pred_3 ?v7 ?v2)))

(:action op_1 
        :parameters (?v8 - type_3 ?v2 - type_4 ?v7 - type_1 ?v1 - type_5)
        :precondition (and (pred_1 ?v7 ?v8) 
		      	   (pred_1 ?v1 ?v8)
			   (pred_3 ?v7 ?v2)
			   (pred_2 ?v2)
			   (pred_4 ?v1))
        :effect (and (not (pred_4 ?v1))(not (pred_2 ?v2)) (pred_5 ?v1)))
)