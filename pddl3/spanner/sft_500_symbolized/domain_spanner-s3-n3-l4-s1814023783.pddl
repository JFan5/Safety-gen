(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_4 type_1 - object
	type_2 type_5 type_3 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_1 ?v3 - type_1 ?v4 - type_4)
	(pred_3 ?v3 - type_2 ?v2 - type_3)
	(pred_6 ?v2 - type_3)
	(pred_5 ?v6 - type_4 ?v1 - type_4)
	(pred_4 ?v7 - type_5)
	(pred_2 ?v7 - type_5))                                                                                           
(:action op_2 
        :parameters (?v8 - type_4 ?v5 - type_4 ?v3 - type_2)
        :precondition (and (pred_1 ?v3 ?v8) 
                           (pred_5 ?v8 ?v5))                                                          
        :effect (and (not (pred_1 ?v3 ?v8)) (pred_1 ?v3 ?v5)))

(:action op_3 
        :parameters (?v4 - type_4 ?v2 - type_3 ?v3 - type_2)
        :precondition (and (pred_1 ?v3 ?v4) 
                           (pred_1 ?v2 ?v4))
        :effect (and (not (pred_1 ?v2 ?v4))
                     (pred_3 ?v3 ?v2)))

(:action op_1 
        :parameters (?v4 - type_4 ?v2 - type_3 ?v3 - type_2 ?v7 - type_5)
        :precondition (and (pred_1 ?v3 ?v4) 
		      	   (pred_1 ?v7 ?v4)
			   (pred_3 ?v3 ?v2)
			   (pred_6 ?v2)
			   (pred_2 ?v7))
        :effect (and (not (pred_2 ?v7))(not (pred_6 ?v2)) (pred_4 ?v7)))
)