(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_1 type_5 - object
	type_3 type_4 type_2 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_1 ?v8 - type_5 ?v1 - type_1)
	(pred_5 ?v8 - type_3 ?v2 - type_2)
	(pred_2 ?v2 - type_2)
	(pred_3 ?v5 - type_1 ?v7 - type_1)
	(pred_6 ?v3 - type_4)
	(pred_4 ?v3 - type_4))                                                                                           
(:action op_2 
        :parameters (?v4 - type_1 ?v6 - type_1 ?v8 - type_3)
        :precondition (and (pred_1 ?v8 ?v4) 
                           (pred_3 ?v4 ?v6))                                                          
        :effect (and (not (pred_1 ?v8 ?v4)) (pred_1 ?v8 ?v6)))

(:action op_3 
        :parameters (?v1 - type_1 ?v2 - type_2 ?v8 - type_3)
        :precondition (and (pred_1 ?v8 ?v1) 
                           (pred_1 ?v2 ?v1))
        :effect (and (not (pred_1 ?v2 ?v1))
                     (pred_5 ?v8 ?v2)))

(:action op_1 
        :parameters (?v1 - type_1 ?v2 - type_2 ?v8 - type_3 ?v3 - type_4)
        :precondition (and (pred_1 ?v8 ?v1) 
		      	   (pred_1 ?v3 ?v1)
			   (pred_5 ?v8 ?v2)
			   (pred_2 ?v2)
			   (pred_4 ?v3))
        :effect (and (not (pred_4 ?v3))(not (pred_2 ?v2)) (pred_6 ?v3)))
)