(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_5 type_1 - object
	type_2 type_4 type_3 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_4 ?v5 - type_1 ?v6 - type_5)
	(pred_5 ?v5 - type_2 ?v1 - type_3)
	(pred_3 ?v1 - type_3)
	(pred_2 ?v2 - type_5 ?v3 - type_5)
	(pred_1 ?v8 - type_4)
	(pred_6 ?v8 - type_4))                                                                                           
(:action op_2 
        :parameters (?v7 - type_5 ?v4 - type_5 ?v5 - type_2)
        :precondition (and (pred_4 ?v5 ?v7) 
                           (pred_2 ?v7 ?v4))                                                          
        :effect (and (not (pred_4 ?v5 ?v7)) (pred_4 ?v5 ?v4)))

(:action op_1 
        :parameters (?v6 - type_5 ?v1 - type_3 ?v5 - type_2)
        :precondition (and (pred_4 ?v5 ?v6) 
                           (pred_4 ?v1 ?v6))
        :effect (and (not (pred_4 ?v1 ?v6))
                     (pred_5 ?v5 ?v1)))

(:action op_3 
        :parameters (?v6 - type_5 ?v1 - type_3 ?v5 - type_2 ?v8 - type_4)
        :precondition (and (pred_4 ?v5 ?v6) 
		      	   (pred_4 ?v8 ?v6)
			   (pred_5 ?v5 ?v1)
			   (pred_3 ?v1)
			   (pred_6 ?v8))
        :effect (and (not (pred_6 ?v8))(not (pred_3 ?v1)) (pred_1 ?v8)))
)