(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_2 type_5 - object
	type_1 type_3 type_4 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_5 ?v6 - type_5 ?v5 - type_2)
	(pred_1 ?v6 - type_1 ?v4 - type_4)
	(pred_4 ?v4 - type_4)
	(pred_6 ?v3 - type_2 ?v2 - type_2)
	(pred_3 ?v8 - type_3)
	(pred_2 ?v8 - type_3))                                                                                           
(:action op_1 
        :parameters (?v7 - type_2 ?v1 - type_2 ?v6 - type_1)
        :precondition (and (pred_5 ?v6 ?v7) 
                           (pred_6 ?v7 ?v1))                                                          
        :effect (and (not (pred_5 ?v6 ?v7)) (pred_5 ?v6 ?v1)))

(:action op_2 
        :parameters (?v5 - type_2 ?v4 - type_4 ?v6 - type_1)
        :precondition (and (pred_5 ?v6 ?v5) 
                           (pred_5 ?v4 ?v5))
        :effect (and (not (pred_5 ?v4 ?v5))
                     (pred_1 ?v6 ?v4)))

(:action op_3 
        :parameters (?v5 - type_2 ?v4 - type_4 ?v6 - type_1 ?v8 - type_3)
        :precondition (and (pred_5 ?v6 ?v5) 
		      	   (pred_5 ?v8 ?v5)
			   (pred_1 ?v6 ?v4)
			   (pred_4 ?v4)
			   (pred_2 ?v8))
        :effect (and (not (pred_2 ?v8))(not (pred_4 ?v4)) (pred_3 ?v8)))
)