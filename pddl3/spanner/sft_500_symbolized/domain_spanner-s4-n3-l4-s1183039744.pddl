(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_4 type_1 - object
	type_5 type_2 type_3 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_2 ?v4 - type_1 ?v7 - type_4)
	(pred_6 ?v4 - type_5 ?v5 - type_3)
	(pred_5 ?v5 - type_3)
	(pred_4 ?v6 - type_4 ?v1 - type_4)
	(pred_1 ?v8 - type_2)
	(pred_3 ?v8 - type_2))                                                                                           
(:action op_3 
        :parameters (?v2 - type_4 ?v3 - type_4 ?v4 - type_5)
        :precondition (and (pred_2 ?v4 ?v2) 
                           (pred_4 ?v2 ?v3))                                                          
        :effect (and (not (pred_2 ?v4 ?v2)) (pred_2 ?v4 ?v3)))

(:action op_2 
        :parameters (?v7 - type_4 ?v5 - type_3 ?v4 - type_5)
        :precondition (and (pred_2 ?v4 ?v7) 
                           (pred_2 ?v5 ?v7))
        :effect (and (not (pred_2 ?v5 ?v7))
                     (pred_6 ?v4 ?v5)))

(:action op_1 
        :parameters (?v7 - type_4 ?v5 - type_3 ?v4 - type_5 ?v8 - type_2)
        :precondition (and (pred_2 ?v4 ?v7) 
		      	   (pred_2 ?v8 ?v7)
			   (pred_6 ?v4 ?v5)
			   (pred_5 ?v5)
			   (pred_3 ?v8))
        :effect (and (not (pred_3 ?v8))(not (pred_5 ?v5)) (pred_1 ?v8)))
)