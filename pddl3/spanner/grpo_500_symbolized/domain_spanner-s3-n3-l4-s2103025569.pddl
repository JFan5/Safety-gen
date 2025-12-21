(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_5 type_2 - object
	type_1 type_4 type_3 - type_2	
)                                           
                                                                               
(:predicates 
	(pred_4 ?v5 - type_2 ?v1 - type_5)
	(pred_3 ?v5 - type_1 ?v8 - type_3)
	(pred_6 ?v8 - type_3)
	(pred_2 ?v6 - type_5 ?v4 - type_5)
	(pred_5 ?v3 - type_4)
	(pred_1 ?v3 - type_4))                                                                                           
(:action op_1 
        :parameters (?v2 - type_5 ?v7 - type_5 ?v5 - type_1)
        :precondition (and (pred_4 ?v5 ?v2) 
                           (pred_2 ?v2 ?v7))                                                          
        :effect (and (not (pred_4 ?v5 ?v2)) (pred_4 ?v5 ?v7)))

(:action op_3 
        :parameters (?v1 - type_5 ?v8 - type_3 ?v5 - type_1)
        :precondition (and (pred_4 ?v5 ?v1) 
                           (pred_4 ?v8 ?v1))
        :effect (and (not (pred_4 ?v8 ?v1))
                     (pred_3 ?v5 ?v8)))

(:action op_2 
        :parameters (?v1 - type_5 ?v8 - type_3 ?v5 - type_1 ?v3 - type_4)
        :precondition (and (pred_4 ?v5 ?v1) 
		      	   (pred_4 ?v3 ?v1)
			   (pred_3 ?v5 ?v8)
			   (pred_6 ?v8)
			   (pred_1 ?v3))
        :effect (and (not (pred_1 ?v3))(not (pred_6 ?v8)) (pred_5 ?v3)))
)