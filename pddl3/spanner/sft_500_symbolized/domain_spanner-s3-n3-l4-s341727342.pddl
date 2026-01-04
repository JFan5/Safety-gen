(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_4 type_5 - object
	type_2 type_1 type_3 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_6 ?v4 - type_5 ?v8 - type_4)
	(pred_3 ?v4 - type_2 ?v5 - type_3)
	(pred_5 ?v5 - type_3)
	(pred_1 ?v1 - type_4 ?v6 - type_4)
	(pred_2 ?v2 - type_1)
	(pred_4 ?v2 - type_1))                                                                                           
(:action op_1 
        :parameters (?v3 - type_4 ?v7 - type_4 ?v4 - type_2)
        :precondition (and (pred_6 ?v4 ?v3) 
                           (pred_1 ?v3 ?v7))                                                          
        :effect (and (not (pred_6 ?v4 ?v3)) (pred_6 ?v4 ?v7)))

(:action op_2 
        :parameters (?v8 - type_4 ?v5 - type_3 ?v4 - type_2)
        :precondition (and (pred_6 ?v4 ?v8) 
                           (pred_6 ?v5 ?v8))
        :effect (and (not (pred_6 ?v5 ?v8))
                     (pred_3 ?v4 ?v5)))

(:action op_3 
        :parameters (?v8 - type_4 ?v5 - type_3 ?v4 - type_2 ?v2 - type_1)
        :precondition (and (pred_6 ?v4 ?v8) 
		      	   (pred_6 ?v2 ?v8)
			   (pred_3 ?v4 ?v5)
			   (pred_5 ?v5)
			   (pred_4 ?v2))
        :effect (and (not (pred_4 ?v2))(not (pred_5 ?v5)) (pred_2 ?v2)))
)