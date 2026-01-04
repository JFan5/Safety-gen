(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_5 type_3 - object
	type_2 type_4 type_1 - type_3	
)                                           
                                                                               
(:predicates 
	(pred_2 ?v5 - type_3 ?v6 - type_5)
	(pred_3 ?v5 - type_2 ?v8 - type_1)
	(pred_1 ?v8 - type_1)
	(pred_6 ?v3 - type_5 ?v7 - type_5)
	(pred_5 ?v4 - type_4)
	(pred_4 ?v4 - type_4))                                                                                           
(:action op_2 
        :parameters (?v2 - type_5 ?v1 - type_5 ?v5 - type_2)
        :precondition (and (pred_2 ?v5 ?v2) 
                           (pred_6 ?v2 ?v1))                                                          
        :effect (and (not (pred_2 ?v5 ?v2)) (pred_2 ?v5 ?v1)))

(:action op_1 
        :parameters (?v6 - type_5 ?v8 - type_1 ?v5 - type_2)
        :precondition (and (pred_2 ?v5 ?v6) 
                           (pred_2 ?v8 ?v6))
        :effect (and (not (pred_2 ?v8 ?v6))
                     (pred_3 ?v5 ?v8)))

(:action op_3 
        :parameters (?v6 - type_5 ?v8 - type_1 ?v5 - type_2 ?v4 - type_4)
        :precondition (and (pred_2 ?v5 ?v6) 
		      	   (pred_2 ?v4 ?v6)
			   (pred_3 ?v5 ?v8)
			   (pred_1 ?v8)
			   (pred_4 ?v4))
        :effect (and (not (pred_4 ?v4))(not (pred_1 ?v8)) (pred_5 ?v4)))
)