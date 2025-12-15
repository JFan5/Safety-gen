(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_4 - object
	type_5 type_1 type_2 - type_4	
)                                           
                                                                               
(:predicates 
	(pred_5 ?v7 - type_4 ?v6 - type_3)
	(pred_4 ?v7 - type_5 ?v3 - type_2)
	(pred_6 ?v3 - type_2)
	(pred_3 ?v1 - type_3 ?v2 - type_3)
	(pred_2 ?v8 - type_1)
	(pred_1 ?v8 - type_1))                                                                                           
(:action op_2 
        :parameters (?v5 - type_3 ?v4 - type_3 ?v7 - type_5)
        :precondition (and (pred_5 ?v7 ?v5) 
                           (pred_3 ?v5 ?v4))                                                          
        :effect (and (not (pred_5 ?v7 ?v5)) (pred_5 ?v7 ?v4)))

(:action op_1 
        :parameters (?v6 - type_3 ?v3 - type_2 ?v7 - type_5)
        :precondition (and (pred_5 ?v7 ?v6) 
                           (pred_5 ?v3 ?v6))
        :effect (and (not (pred_5 ?v3 ?v6))
                     (pred_4 ?v7 ?v3)))

(:action op_3 
        :parameters (?v6 - type_3 ?v3 - type_2 ?v7 - type_5 ?v8 - type_1)
        :precondition (and (pred_5 ?v7 ?v6) 
		      	   (pred_5 ?v8 ?v6)
			   (pred_4 ?v7 ?v3)
			   (pred_6 ?v3)
			   (pred_1 ?v8))
        :effect (and (not (pred_1 ?v8))(not (pred_6 ?v3)) (pred_2 ?v8)))
)