(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_4 type_5 - object
	type_1 type_2 type_3 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_4 ?v6 - type_5 ?v1 - type_4)
	(pred_2 ?v6 - type_1 ?v4 - type_3)
	(pred_1 ?v4 - type_3)
	(pred_3 ?v7 - type_4 ?v3 - type_4)
	(pred_5 ?v8 - type_2)
	(pred_6 ?v8 - type_2))                                                                                           
(:action op_2 
        :parameters (?v2 - type_4 ?v5 - type_4 ?v6 - type_1)
        :precondition (and (pred_4 ?v6 ?v2) 
                           (pred_3 ?v2 ?v5))                                                          
        :effect (and (not (pred_4 ?v6 ?v2)) (pred_4 ?v6 ?v5)))

(:action op_3 
        :parameters (?v1 - type_4 ?v4 - type_3 ?v6 - type_1)
        :precondition (and (pred_4 ?v6 ?v1) 
                           (pred_4 ?v4 ?v1))
        :effect (and (not (pred_4 ?v4 ?v1))
                     (pred_2 ?v6 ?v4)))

(:action op_1 
        :parameters (?v1 - type_4 ?v4 - type_3 ?v6 - type_1 ?v8 - type_2)
        :precondition (and (pred_4 ?v6 ?v1) 
		      	   (pred_4 ?v8 ?v1)
			   (pred_2 ?v6 ?v4)
			   (pred_1 ?v4)
			   (pred_6 ?v8))
        :effect (and (not (pred_6 ?v8))(not (pred_1 ?v4)) (pred_5 ?v8)))
)