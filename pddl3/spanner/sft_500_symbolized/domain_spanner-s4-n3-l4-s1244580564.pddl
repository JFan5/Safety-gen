(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_2 type_1 - object
	type_4 type_3 type_5 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_2 ?v2 - type_1 ?v7 - type_2)
	(pred_3 ?v2 - type_4 ?v3 - type_5)
	(pred_1 ?v3 - type_5)
	(pred_4 ?v4 - type_2 ?v1 - type_2)
	(pred_6 ?v5 - type_3)
	(pred_5 ?v5 - type_3))                                                                                           
(:action op_2 
        :parameters (?v8 - type_2 ?v6 - type_2 ?v2 - type_4)
        :precondition (and (pred_2 ?v2 ?v8) 
                           (pred_4 ?v8 ?v6))                                                          
        :effect (and (not (pred_2 ?v2 ?v8)) (pred_2 ?v2 ?v6)))

(:action op_3 
        :parameters (?v7 - type_2 ?v3 - type_5 ?v2 - type_4)
        :precondition (and (pred_2 ?v2 ?v7) 
                           (pred_2 ?v3 ?v7))
        :effect (and (not (pred_2 ?v3 ?v7))
                     (pred_3 ?v2 ?v3)))

(:action op_1 
        :parameters (?v7 - type_2 ?v3 - type_5 ?v2 - type_4 ?v5 - type_3)
        :precondition (and (pred_2 ?v2 ?v7) 
		      	   (pred_2 ?v5 ?v7)
			   (pred_3 ?v2 ?v3)
			   (pred_1 ?v3)
			   (pred_5 ?v5))
        :effect (and (not (pred_5 ?v5))(not (pred_1 ?v3)) (pred_6 ?v5)))
)