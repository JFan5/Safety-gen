(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_2 - object
	type_5 type_1 type_4 - type_2	
)                                           
                                                                               
(:predicates 
	(pred_6 ?v8 - type_2 ?v1 - type_3)
	(pred_2 ?v8 - type_5 ?v2 - type_4)
	(pred_3 ?v2 - type_4)
	(pred_4 ?v6 - type_3 ?v4 - type_3)
	(pred_5 ?v5 - type_1)
	(pred_1 ?v5 - type_1))                                                                                           
(:action op_3 
        :parameters (?v7 - type_3 ?v3 - type_3 ?v8 - type_5)
        :precondition (and (pred_6 ?v8 ?v7) 
                           (pred_4 ?v7 ?v3))                                                          
        :effect (and (not (pred_6 ?v8 ?v7)) (pred_6 ?v8 ?v3)))

(:action op_1 
        :parameters (?v1 - type_3 ?v2 - type_4 ?v8 - type_5)
        :precondition (and (pred_6 ?v8 ?v1) 
                           (pred_6 ?v2 ?v1))
        :effect (and (not (pred_6 ?v2 ?v1))
                     (pred_2 ?v8 ?v2)))

(:action op_2 
        :parameters (?v1 - type_3 ?v2 - type_4 ?v8 - type_5 ?v5 - type_1)
        :precondition (and (pred_6 ?v8 ?v1) 
		      	   (pred_6 ?v5 ?v1)
			   (pred_2 ?v8 ?v2)
			   (pred_3 ?v2)
			   (pred_1 ?v5))
        :effect (and (not (pred_1 ?v5))(not (pred_3 ?v2)) (pred_5 ?v5)))
)