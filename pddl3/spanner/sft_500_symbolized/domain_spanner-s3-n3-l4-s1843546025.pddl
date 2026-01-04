(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_1 - object
	type_2 type_5 type_4 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_5 ?v2 - type_1 ?v6 - type_3)
	(pred_4 ?v2 - type_2 ?v8 - type_4)
	(pred_3 ?v8 - type_4)
	(pred_6 ?v1 - type_3 ?v3 - type_3)
	(pred_2 ?v5 - type_5)
	(pred_1 ?v5 - type_5))                                                                                           
(:action op_2 
        :parameters (?v7 - type_3 ?v4 - type_3 ?v2 - type_2)
        :precondition (and (pred_5 ?v2 ?v7) 
                           (pred_6 ?v7 ?v4))                                                          
        :effect (and (not (pred_5 ?v2 ?v7)) (pred_5 ?v2 ?v4)))

(:action op_1 
        :parameters (?v6 - type_3 ?v8 - type_4 ?v2 - type_2)
        :precondition (and (pred_5 ?v2 ?v6) 
                           (pred_5 ?v8 ?v6))
        :effect (and (not (pred_5 ?v8 ?v6))
                     (pred_4 ?v2 ?v8)))

(:action op_3 
        :parameters (?v6 - type_3 ?v8 - type_4 ?v2 - type_2 ?v5 - type_5)
        :precondition (and (pred_5 ?v2 ?v6) 
		      	   (pred_5 ?v5 ?v6)
			   (pred_4 ?v2 ?v8)
			   (pred_3 ?v8)
			   (pred_1 ?v5))
        :effect (and (not (pred_1 ?v5))(not (pred_3 ?v8)) (pred_2 ?v5)))
)