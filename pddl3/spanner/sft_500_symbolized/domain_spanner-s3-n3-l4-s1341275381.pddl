(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_1 type_4 - object
	type_2 type_3 type_5 - type_4	
)                                           
                                                                               
(:predicates 
	(pred_6 ?v4 - type_4 ?v3 - type_1)
	(pred_3 ?v4 - type_2 ?v8 - type_5)
	(pred_4 ?v8 - type_5)
	(pred_5 ?v7 - type_1 ?v2 - type_1)
	(pred_2 ?v5 - type_3)
	(pred_1 ?v5 - type_3))                                                                                           
(:action op_1 
        :parameters (?v6 - type_1 ?v1 - type_1 ?v4 - type_2)
        :precondition (and (pred_6 ?v4 ?v6) 
                           (pred_5 ?v6 ?v1))                                                          
        :effect (and (not (pred_6 ?v4 ?v6)) (pred_6 ?v4 ?v1)))

(:action op_2 
        :parameters (?v3 - type_1 ?v8 - type_5 ?v4 - type_2)
        :precondition (and (pred_6 ?v4 ?v3) 
                           (pred_6 ?v8 ?v3))
        :effect (and (not (pred_6 ?v8 ?v3))
                     (pred_3 ?v4 ?v8)))

(:action op_3 
        :parameters (?v3 - type_1 ?v8 - type_5 ?v4 - type_2 ?v5 - type_3)
        :precondition (and (pred_6 ?v4 ?v3) 
		      	   (pred_6 ?v5 ?v3)
			   (pred_3 ?v4 ?v8)
			   (pred_4 ?v8)
			   (pred_1 ?v5))
        :effect (and (not (pred_1 ?v5))(not (pred_4 ?v8)) (pred_2 ?v5)))
)