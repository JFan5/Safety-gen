(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_2 type_5 - object
	type_4 type_3 type_1 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_6 ?v8 - type_5 ?v3 - type_2)
	(pred_2 ?v8 - type_4 ?v5 - type_1)
	(pred_5 ?v5 - type_1)
	(pred_4 ?v1 - type_2 ?v6 - type_2)
	(pred_1 ?v4 - type_3)
	(pred_3 ?v4 - type_3))                                                                                           
(:action op_3 
        :parameters (?v7 - type_2 ?v2 - type_2 ?v8 - type_4)
        :precondition (and (pred_6 ?v8 ?v7) 
                           (pred_4 ?v7 ?v2))                                                          
        :effect (and (not (pred_6 ?v8 ?v7)) (pred_6 ?v8 ?v2)))

(:action op_2 
        :parameters (?v3 - type_2 ?v5 - type_1 ?v8 - type_4)
        :precondition (and (pred_6 ?v8 ?v3) 
                           (pred_6 ?v5 ?v3))
        :effect (and (not (pred_6 ?v5 ?v3))
                     (pred_2 ?v8 ?v5)))

(:action op_1 
        :parameters (?v3 - type_2 ?v5 - type_1 ?v8 - type_4 ?v4 - type_3)
        :precondition (and (pred_6 ?v8 ?v3) 
		      	   (pred_6 ?v4 ?v3)
			   (pred_2 ?v8 ?v5)
			   (pred_5 ?v5)
			   (pred_3 ?v4))
        :effect (and (not (pred_3 ?v4))(not (pred_5 ?v5)) (pred_1 ?v4)))
)