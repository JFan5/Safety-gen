(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_1 - object
	type_4 type_5 type_2 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_5 ?v2 - type_1 ?v4 - type_3)
	(pred_2 ?v2 - type_4 ?v8 - type_2)
	(pred_3 ?v8 - type_2)
	(pred_4 ?v5 - type_3 ?v6 - type_3)
	(pred_1 ?v7 - type_5)
	(pred_6 ?v7 - type_5))                                                                                           
(:action op_1 
        :parameters (?v3 - type_3 ?v1 - type_3 ?v2 - type_4)
        :precondition (and (pred_5 ?v2 ?v3) 
                           (pred_4 ?v3 ?v1))                                                          
        :effect (and (not (pred_5 ?v2 ?v3)) (pred_5 ?v2 ?v1)))

(:action op_3 
        :parameters (?v4 - type_3 ?v8 - type_2 ?v2 - type_4)
        :precondition (and (pred_5 ?v2 ?v4) 
                           (pred_5 ?v8 ?v4))
        :effect (and (not (pred_5 ?v8 ?v4))
                     (pred_2 ?v2 ?v8)))

(:action op_2 
        :parameters (?v4 - type_3 ?v8 - type_2 ?v2 - type_4 ?v7 - type_5)
        :precondition (and (pred_5 ?v2 ?v4) 
		      	   (pred_5 ?v7 ?v4)
			   (pred_2 ?v2 ?v8)
			   (pred_3 ?v8)
			   (pred_6 ?v7))
        :effect (and (not (pred_6 ?v7))(not (pred_3 ?v8)) (pred_1 ?v7)))
)