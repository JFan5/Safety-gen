(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_5 type_3 - object
	type_2 type_4 type_1 - type_3	
)                                           
                                                                               
(:predicates 
	(pred_2 ?v5 - type_3 ?v8 - type_5)
	(pred_6 ?v5 - type_2 ?v6 - type_1)
	(pred_3 ?v6 - type_1)
	(pred_4 ?v2 - type_5 ?v1 - type_5)
	(pred_1 ?v4 - type_4)
	(pred_5 ?v4 - type_4))                                                                                           
(:action op_1 
        :parameters (?v7 - type_5 ?v3 - type_5 ?v5 - type_2)
        :precondition (and (pred_2 ?v5 ?v7) 
                           (pred_4 ?v7 ?v3))                                                          
        :effect (and (not (pred_2 ?v5 ?v7)) (pred_2 ?v5 ?v3)))

(:action op_3 
        :parameters (?v8 - type_5 ?v6 - type_1 ?v5 - type_2)
        :precondition (and (pred_2 ?v5 ?v8) 
                           (pred_2 ?v6 ?v8))
        :effect (and (not (pred_2 ?v6 ?v8))
                     (pred_6 ?v5 ?v6)))

(:action op_2 
        :parameters (?v8 - type_5 ?v6 - type_1 ?v5 - type_2 ?v4 - type_4)
        :precondition (and (pred_2 ?v5 ?v8) 
		      	   (pred_2 ?v4 ?v8)
			   (pred_6 ?v5 ?v6)
			   (pred_3 ?v6)
			   (pred_5 ?v4))
        :effect (and (not (pred_5 ?v4))(not (pred_3 ?v6)) (pred_1 ?v4)))
)