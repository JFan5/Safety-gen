(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_5 type_2 - object
	type_1 type_3 type_4 - type_2	
)                                           
                                                                               
(:predicates 
	(pred_5 ?v4 - type_2 ?v6 - type_5)
	(pred_2 ?v4 - type_1 ?v5 - type_4)
	(pred_6 ?v5 - type_4)
	(pred_1 ?v3 - type_5 ?v1 - type_5)
	(pred_3 ?v7 - type_3)
	(pred_4 ?v7 - type_3))                                                                                           
(:action op_1 
        :parameters (?v2 - type_5 ?v8 - type_5 ?v4 - type_1)
        :precondition (and (pred_5 ?v4 ?v2) 
                           (pred_1 ?v2 ?v8))                                                          
        :effect (and (not (pred_5 ?v4 ?v2)) (pred_5 ?v4 ?v8)))

(:action op_2 
        :parameters (?v6 - type_5 ?v5 - type_4 ?v4 - type_1)
        :precondition (and (pred_5 ?v4 ?v6) 
                           (pred_5 ?v5 ?v6))
        :effect (and (not (pred_5 ?v5 ?v6))
                     (pred_2 ?v4 ?v5)))

(:action op_3 
        :parameters (?v6 - type_5 ?v5 - type_4 ?v4 - type_1 ?v7 - type_3)
        :precondition (and (pred_5 ?v4 ?v6) 
		      	   (pred_5 ?v7 ?v6)
			   (pred_2 ?v4 ?v5)
			   (pred_6 ?v5)
			   (pred_4 ?v7))
        :effect (and (not (pred_4 ?v7))(not (pred_6 ?v5)) (pred_3 ?v7)))
)