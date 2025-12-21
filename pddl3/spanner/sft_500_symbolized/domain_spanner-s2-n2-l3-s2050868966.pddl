(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_2 type_3 - object
	type_5 type_4 type_1 - type_3	
)                                           
                                                                               
(:predicates 
	(pred_4 ?v8 - type_3 ?v3 - type_2)
	(pred_2 ?v8 - type_5 ?v5 - type_1)
	(pred_3 ?v5 - type_1)
	(pred_5 ?v2 - type_2 ?v6 - type_2)
	(pred_1 ?v4 - type_4)
	(pred_6 ?v4 - type_4))                                                                                           
(:action op_2 
        :parameters (?v7 - type_2 ?v1 - type_2 ?v8 - type_5)
        :precondition (and (pred_4 ?v8 ?v7) 
                           (pred_5 ?v7 ?v1))                                                          
        :effect (and (not (pred_4 ?v8 ?v7)) (pred_4 ?v8 ?v1)))

(:action op_3 
        :parameters (?v3 - type_2 ?v5 - type_1 ?v8 - type_5)
        :precondition (and (pred_4 ?v8 ?v3) 
                           (pred_4 ?v5 ?v3))
        :effect (and (not (pred_4 ?v5 ?v3))
                     (pred_2 ?v8 ?v5)))

(:action op_1 
        :parameters (?v3 - type_2 ?v5 - type_1 ?v8 - type_5 ?v4 - type_4)
        :precondition (and (pred_4 ?v8 ?v3) 
		      	   (pred_4 ?v4 ?v3)
			   (pred_2 ?v8 ?v5)
			   (pred_3 ?v5)
			   (pred_6 ?v4))
        :effect (and (not (pred_6 ?v4))(not (pred_3 ?v5)) (pred_1 ?v4)))
)