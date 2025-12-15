(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_1 - object
	type_5 type_2 type_4 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_3 ?v7 - type_1 ?v6 - type_3)
	(pred_4 ?v7 - type_5 ?v8 - type_4)
	(pred_6 ?v8 - type_4)
	(pred_2 ?v2 - type_3 ?v1 - type_3)
	(pred_1 ?v4 - type_2)
	(pred_5 ?v4 - type_2))                                                                                           
(:action op_1 
        :parameters (?v3 - type_3 ?v5 - type_3 ?v7 - type_5)
        :precondition (and (pred_3 ?v7 ?v3) 
                           (pred_2 ?v3 ?v5))                                                          
        :effect (and (not (pred_3 ?v7 ?v3)) (pred_3 ?v7 ?v5)))

(:action op_2 
        :parameters (?v6 - type_3 ?v8 - type_4 ?v7 - type_5)
        :precondition (and (pred_3 ?v7 ?v6) 
                           (pred_3 ?v8 ?v6))
        :effect (and (not (pred_3 ?v8 ?v6))
                     (pred_4 ?v7 ?v8)))

(:action op_3 
        :parameters (?v6 - type_3 ?v8 - type_4 ?v7 - type_5 ?v4 - type_2)
        :precondition (and (pred_3 ?v7 ?v6) 
		      	   (pred_3 ?v4 ?v6)
			   (pred_4 ?v7 ?v8)
			   (pred_6 ?v8)
			   (pred_5 ?v4))
        :effect (and (not (pred_5 ?v4))(not (pred_6 ?v8)) (pred_1 ?v4)))
)