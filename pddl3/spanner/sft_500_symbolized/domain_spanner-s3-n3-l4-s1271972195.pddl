(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_2 type_3 - object
	type_1 type_5 type_4 - type_3	
)                                           
                                                                               
(:predicates 
	(pred_4 ?v2 - type_3 ?v7 - type_2)
	(pred_1 ?v2 - type_1 ?v5 - type_4)
	(pred_5 ?v5 - type_4)
	(pred_6 ?v1 - type_2 ?v4 - type_2)
	(pred_3 ?v8 - type_5)
	(pred_2 ?v8 - type_5))                                                                                           
(:action op_3 
        :parameters (?v6 - type_2 ?v3 - type_2 ?v2 - type_1)
        :precondition (and (pred_4 ?v2 ?v6) 
                           (pred_6 ?v6 ?v3))                                                          
        :effect (and (not (pred_4 ?v2 ?v6)) (pred_4 ?v2 ?v3)))

(:action op_1 
        :parameters (?v7 - type_2 ?v5 - type_4 ?v2 - type_1)
        :precondition (and (pred_4 ?v2 ?v7) 
                           (pred_4 ?v5 ?v7))
        :effect (and (not (pred_4 ?v5 ?v7))
                     (pred_1 ?v2 ?v5)))

(:action op_2 
        :parameters (?v7 - type_2 ?v5 - type_4 ?v2 - type_1 ?v8 - type_5)
        :precondition (and (pred_4 ?v2 ?v7) 
		      	   (pred_4 ?v8 ?v7)
			   (pred_1 ?v2 ?v5)
			   (pred_5 ?v5)
			   (pred_2 ?v8))
        :effect (and (not (pred_2 ?v8))(not (pred_5 ?v5)) (pred_3 ?v8)))
)