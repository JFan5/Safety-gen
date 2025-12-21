(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_1 type_4 - object
	type_5 type_2 type_3 - type_4	
)                                           
                                                                               
(:predicates 
	(pred_6 ?v6 - type_4 ?v3 - type_1)
	(pred_5 ?v6 - type_5 ?v8 - type_3)
	(pred_3 ?v8 - type_3)
	(pred_2 ?v7 - type_1 ?v2 - type_1)
	(pred_4 ?v5 - type_2)
	(pred_1 ?v5 - type_2))                                                                                           
(:action op_1 
        :parameters (?v4 - type_1 ?v1 - type_1 ?v6 - type_5)
        :precondition (and (pred_6 ?v6 ?v4) 
                           (pred_2 ?v4 ?v1))                                                          
        :effect (and (not (pred_6 ?v6 ?v4)) (pred_6 ?v6 ?v1)))

(:action op_2 
        :parameters (?v3 - type_1 ?v8 - type_3 ?v6 - type_5)
        :precondition (and (pred_6 ?v6 ?v3) 
                           (pred_6 ?v8 ?v3))
        :effect (and (not (pred_6 ?v8 ?v3))
                     (pred_5 ?v6 ?v8)))

(:action op_3 
        :parameters (?v3 - type_1 ?v8 - type_3 ?v6 - type_5 ?v5 - type_2)
        :precondition (and (pred_6 ?v6 ?v3) 
		      	   (pred_6 ?v5 ?v3)
			   (pred_5 ?v6 ?v8)
			   (pred_3 ?v8)
			   (pred_1 ?v5))
        :effect (and (not (pred_1 ?v5))(not (pred_3 ?v8)) (pred_4 ?v5)))
)