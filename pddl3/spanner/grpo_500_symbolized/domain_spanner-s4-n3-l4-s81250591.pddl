(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_5 type_1 - object
	type_3 type_4 type_2 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_3 ?v8 - type_1 ?v1 - type_5)
	(pred_2 ?v8 - type_3 ?v2 - type_2)
	(pred_4 ?v2 - type_2)
	(pred_5 ?v5 - type_5 ?v4 - type_5)
	(pred_1 ?v3 - type_4)
	(pred_6 ?v3 - type_4))                                                                                           
(:action op_1 
        :parameters (?v7 - type_5 ?v6 - type_5 ?v8 - type_3)
        :precondition (and (pred_3 ?v8 ?v7) 
                           (pred_5 ?v7 ?v6))                                                          
        :effect (and (not (pred_3 ?v8 ?v7)) (pred_3 ?v8 ?v6)))

(:action op_3 
        :parameters (?v1 - type_5 ?v2 - type_2 ?v8 - type_3)
        :precondition (and (pred_3 ?v8 ?v1) 
                           (pred_3 ?v2 ?v1))
        :effect (and (not (pred_3 ?v2 ?v1))
                     (pred_2 ?v8 ?v2)))

(:action op_2 
        :parameters (?v1 - type_5 ?v2 - type_2 ?v8 - type_3 ?v3 - type_4)
        :precondition (and (pred_3 ?v8 ?v1) 
		      	   (pred_3 ?v3 ?v1)
			   (pred_2 ?v8 ?v2)
			   (pred_4 ?v2)
			   (pred_6 ?v3))
        :effect (and (not (pred_6 ?v3))(not (pred_4 ?v2)) (pred_1 ?v3)))
)