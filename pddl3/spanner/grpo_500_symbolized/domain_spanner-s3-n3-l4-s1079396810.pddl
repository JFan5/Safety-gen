(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_5 - object
	type_1 type_2 type_4 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_4 ?v8 - type_5 ?v2 - type_3)
	(pred_5 ?v8 - type_1 ?v3 - type_4)
	(pred_2 ?v3 - type_4)
	(pred_1 ?v7 - type_3 ?v4 - type_3)
	(pred_3 ?v5 - type_2)
	(pred_6 ?v5 - type_2))                                                                                           
(:action op_2 
        :parameters (?v6 - type_3 ?v1 - type_3 ?v8 - type_1)
        :precondition (and (pred_4 ?v8 ?v6) 
                           (pred_1 ?v6 ?v1))                                                          
        :effect (and (not (pred_4 ?v8 ?v6)) (pred_4 ?v8 ?v1)))

(:action op_3 
        :parameters (?v2 - type_3 ?v3 - type_4 ?v8 - type_1)
        :precondition (and (pred_4 ?v8 ?v2) 
                           (pred_4 ?v3 ?v2))
        :effect (and (not (pred_4 ?v3 ?v2))
                     (pred_5 ?v8 ?v3)))

(:action op_1 
        :parameters (?v2 - type_3 ?v3 - type_4 ?v8 - type_1 ?v5 - type_2)
        :precondition (and (pred_4 ?v8 ?v2) 
		      	   (pred_4 ?v5 ?v2)
			   (pred_5 ?v8 ?v3)
			   (pred_2 ?v3)
			   (pred_6 ?v5))
        :effect (and (not (pred_6 ?v5))(not (pred_2 ?v3)) (pred_3 ?v5)))
)