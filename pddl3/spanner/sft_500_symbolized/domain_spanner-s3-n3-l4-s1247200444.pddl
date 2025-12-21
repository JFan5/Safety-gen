(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_4 type_1 - object
	type_5 type_2 type_3 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_5 ?v8 - type_1 ?v3 - type_4)
	(pred_6 ?v8 - type_5 ?v2 - type_3)
	(pred_3 ?v2 - type_3)
	(pred_2 ?v7 - type_4 ?v1 - type_4)
	(pred_1 ?v5 - type_2)
	(pred_4 ?v5 - type_2))                                                                                           
(:action op_1 
        :parameters (?v6 - type_4 ?v4 - type_4 ?v8 - type_5)
        :precondition (and (pred_5 ?v8 ?v6) 
                           (pred_2 ?v6 ?v4))                                                          
        :effect (and (not (pred_5 ?v8 ?v6)) (pred_5 ?v8 ?v4)))

(:action op_2 
        :parameters (?v3 - type_4 ?v2 - type_3 ?v8 - type_5)
        :precondition (and (pred_5 ?v8 ?v3) 
                           (pred_5 ?v2 ?v3))
        :effect (and (not (pred_5 ?v2 ?v3))
                     (pred_6 ?v8 ?v2)))

(:action op_3 
        :parameters (?v3 - type_4 ?v2 - type_3 ?v8 - type_5 ?v5 - type_2)
        :precondition (and (pred_5 ?v8 ?v3) 
		      	   (pred_5 ?v5 ?v3)
			   (pred_6 ?v8 ?v2)
			   (pred_3 ?v2)
			   (pred_4 ?v5))
        :effect (and (not (pred_4 ?v5))(not (pred_3 ?v2)) (pred_1 ?v5)))
)