(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_2 type_4 - object
	type_5 type_3 type_1 - type_4	
)                                           
                                                                               
(:predicates 
	(pred_6 ?v3 - type_4 ?v8 - type_2)
	(pred_1 ?v3 - type_5 ?v6 - type_1)
	(pred_2 ?v6 - type_1)
	(pred_5 ?v4 - type_2 ?v1 - type_2)
	(pred_4 ?v2 - type_3)
	(pred_3 ?v2 - type_3))                                                                                           
(:action op_2 
        :parameters (?v7 - type_2 ?v5 - type_2 ?v3 - type_5)
        :precondition (and (pred_6 ?v3 ?v7) 
                           (pred_5 ?v7 ?v5))                                                          
        :effect (and (not (pred_6 ?v3 ?v7)) (pred_6 ?v3 ?v5)))

(:action op_3 
        :parameters (?v8 - type_2 ?v6 - type_1 ?v3 - type_5)
        :precondition (and (pred_6 ?v3 ?v8) 
                           (pred_6 ?v6 ?v8))
        :effect (and (not (pred_6 ?v6 ?v8))
                     (pred_1 ?v3 ?v6)))

(:action op_1 
        :parameters (?v8 - type_2 ?v6 - type_1 ?v3 - type_5 ?v2 - type_3)
        :precondition (and (pred_6 ?v3 ?v8) 
		      	   (pred_6 ?v2 ?v8)
			   (pred_1 ?v3 ?v6)
			   (pred_2 ?v6)
			   (pred_3 ?v2))
        :effect (and (not (pred_3 ?v2))(not (pred_2 ?v6)) (pred_4 ?v2)))
)