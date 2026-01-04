(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_2 type_4 - object
	type_5 type_1 type_3 - type_4	
)                                           
                                                                               
(:predicates 
	(pred_2 ?v8 - type_4 ?v1 - type_2)
	(pred_5 ?v8 - type_5 ?v6 - type_3)
	(pred_1 ?v6 - type_3)
	(pred_4 ?v3 - type_2 ?v2 - type_2)
	(pred_3 ?v4 - type_1)
	(pred_6 ?v4 - type_1))                                                                                           
(:action op_3 
        :parameters (?v7 - type_2 ?v5 - type_2 ?v8 - type_5)
        :precondition (and (pred_2 ?v8 ?v7) 
                           (pred_4 ?v7 ?v5))                                                          
        :effect (and (not (pred_2 ?v8 ?v7)) (pred_2 ?v8 ?v5)))

(:action op_2 
        :parameters (?v1 - type_2 ?v6 - type_3 ?v8 - type_5)
        :precondition (and (pred_2 ?v8 ?v1) 
                           (pred_2 ?v6 ?v1))
        :effect (and (not (pred_2 ?v6 ?v1))
                     (pred_5 ?v8 ?v6)))

(:action op_1 
        :parameters (?v1 - type_2 ?v6 - type_3 ?v8 - type_5 ?v4 - type_1)
        :precondition (and (pred_2 ?v8 ?v1) 
		      	   (pred_2 ?v4 ?v1)
			   (pred_5 ?v8 ?v6)
			   (pred_1 ?v6)
			   (pred_6 ?v4))
        :effect (and (not (pred_6 ?v4))(not (pred_1 ?v6)) (pred_3 ?v4)))
)