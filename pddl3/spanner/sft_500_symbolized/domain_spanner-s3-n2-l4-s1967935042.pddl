(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_4 type_2 - object
	type_3 type_5 type_1 - type_2	
)                                           
                                                                               
(:predicates 
	(pred_4 ?v8 - type_2 ?v2 - type_4)
	(pred_3 ?v8 - type_3 ?v5 - type_1)
	(pred_2 ?v5 - type_1)
	(pred_5 ?v6 - type_4 ?v7 - type_4)
	(pred_6 ?v1 - type_5)
	(pred_1 ?v1 - type_5))                                                                                           
(:action op_2 
        :parameters (?v3 - type_4 ?v4 - type_4 ?v8 - type_3)
        :precondition (and (pred_4 ?v8 ?v3) 
                           (pred_5 ?v3 ?v4))                                                          
        :effect (and (not (pred_4 ?v8 ?v3)) (pred_4 ?v8 ?v4)))

(:action op_1 
        :parameters (?v2 - type_4 ?v5 - type_1 ?v8 - type_3)
        :precondition (and (pred_4 ?v8 ?v2) 
                           (pred_4 ?v5 ?v2))
        :effect (and (not (pred_4 ?v5 ?v2))
                     (pred_3 ?v8 ?v5)))

(:action op_3 
        :parameters (?v2 - type_4 ?v5 - type_1 ?v8 - type_3 ?v1 - type_5)
        :precondition (and (pred_4 ?v8 ?v2) 
		      	   (pred_4 ?v1 ?v2)
			   (pred_3 ?v8 ?v5)
			   (pred_2 ?v5)
			   (pred_1 ?v1))
        :effect (and (not (pred_1 ?v1))(not (pred_2 ?v5)) (pred_6 ?v1)))
)