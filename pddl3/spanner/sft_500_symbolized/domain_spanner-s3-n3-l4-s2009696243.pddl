(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_1 type_4 - object
	type_3 type_2 type_5 - type_4	
)                                           
                                                                               
(:predicates 
	(pred_1 ?v7 - type_4 ?v8 - type_1)
	(pred_5 ?v7 - type_3 ?v6 - type_5)
	(pred_3 ?v6 - type_5)
	(pred_4 ?v4 - type_1 ?v1 - type_1)
	(pred_6 ?v3 - type_2)
	(pred_2 ?v3 - type_2))                                                                                           
(:action op_3 
        :parameters (?v2 - type_1 ?v5 - type_1 ?v7 - type_3)
        :precondition (and (pred_1 ?v7 ?v2) 
                           (pred_4 ?v2 ?v5))                                                          
        :effect (and (not (pred_1 ?v7 ?v2)) (pred_1 ?v7 ?v5)))

(:action op_2 
        :parameters (?v8 - type_1 ?v6 - type_5 ?v7 - type_3)
        :precondition (and (pred_1 ?v7 ?v8) 
                           (pred_1 ?v6 ?v8))
        :effect (and (not (pred_1 ?v6 ?v8))
                     (pred_5 ?v7 ?v6)))

(:action op_1 
        :parameters (?v8 - type_1 ?v6 - type_5 ?v7 - type_3 ?v3 - type_2)
        :precondition (and (pred_1 ?v7 ?v8) 
		      	   (pred_1 ?v3 ?v8)
			   (pred_5 ?v7 ?v6)
			   (pred_3 ?v6)
			   (pred_2 ?v3))
        :effect (and (not (pred_2 ?v3))(not (pred_3 ?v6)) (pred_6 ?v3)))
)