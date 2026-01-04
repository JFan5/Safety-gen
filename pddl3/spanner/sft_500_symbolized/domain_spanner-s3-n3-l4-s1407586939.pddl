(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_2 - object
	type_1 type_5 type_4 - type_2	
)                                           
                                                                               
(:predicates 
	(pred_6 ?v4 - type_2 ?v5 - type_3)
	(pred_2 ?v4 - type_1 ?v3 - type_4)
	(pred_4 ?v3 - type_4)
	(pred_5 ?v1 - type_3 ?v2 - type_3)
	(pred_1 ?v7 - type_5)
	(pred_3 ?v7 - type_5))                                                                                           
(:action op_1 
        :parameters (?v6 - type_3 ?v8 - type_3 ?v4 - type_1)
        :precondition (and (pred_6 ?v4 ?v6) 
                           (pred_5 ?v6 ?v8))                                                          
        :effect (and (not (pred_6 ?v4 ?v6)) (pred_6 ?v4 ?v8)))

(:action op_2 
        :parameters (?v5 - type_3 ?v3 - type_4 ?v4 - type_1)
        :precondition (and (pred_6 ?v4 ?v5) 
                           (pred_6 ?v3 ?v5))
        :effect (and (not (pred_6 ?v3 ?v5))
                     (pred_2 ?v4 ?v3)))

(:action op_3 
        :parameters (?v5 - type_3 ?v3 - type_4 ?v4 - type_1 ?v7 - type_5)
        :precondition (and (pred_6 ?v4 ?v5) 
		      	   (pred_6 ?v7 ?v5)
			   (pred_2 ?v4 ?v3)
			   (pred_4 ?v3)
			   (pred_3 ?v7))
        :effect (and (not (pred_3 ?v7))(not (pred_4 ?v3)) (pred_1 ?v7)))
)