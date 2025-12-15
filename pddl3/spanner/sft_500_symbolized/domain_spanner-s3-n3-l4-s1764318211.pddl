(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_2 type_3 - object
	type_4 type_5 type_1 - type_3	
)                                           
                                                                               
(:predicates 
	(pred_4 ?v6 - type_3 ?v8 - type_2)
	(pred_5 ?v6 - type_4 ?v2 - type_1)
	(pred_1 ?v2 - type_1)
	(pred_6 ?v3 - type_2 ?v5 - type_2)
	(pred_2 ?v4 - type_5)
	(pred_3 ?v4 - type_5))                                                                                           
(:action op_3 
        :parameters (?v7 - type_2 ?v1 - type_2 ?v6 - type_4)
        :precondition (and (pred_4 ?v6 ?v7) 
                           (pred_6 ?v7 ?v1))                                                          
        :effect (and (not (pred_4 ?v6 ?v7)) (pred_4 ?v6 ?v1)))

(:action op_2 
        :parameters (?v8 - type_2 ?v2 - type_1 ?v6 - type_4)
        :precondition (and (pred_4 ?v6 ?v8) 
                           (pred_4 ?v2 ?v8))
        :effect (and (not (pred_4 ?v2 ?v8))
                     (pred_5 ?v6 ?v2)))

(:action op_1 
        :parameters (?v8 - type_2 ?v2 - type_1 ?v6 - type_4 ?v4 - type_5)
        :precondition (and (pred_4 ?v6 ?v8) 
		      	   (pred_4 ?v4 ?v8)
			   (pred_5 ?v6 ?v2)
			   (pred_1 ?v2)
			   (pred_3 ?v4))
        :effect (and (not (pred_3 ?v4))(not (pred_1 ?v2)) (pred_2 ?v4)))
)