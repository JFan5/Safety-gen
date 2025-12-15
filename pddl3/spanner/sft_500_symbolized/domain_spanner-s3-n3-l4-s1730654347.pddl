(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_5 type_2 - object
	type_4 type_3 type_1 - type_2	
)                                           
                                                                               
(:predicates 
	(pred_1 ?v2 - type_2 ?v7 - type_5)
	(pred_2 ?v2 - type_4 ?v8 - type_1)
	(pred_5 ?v8 - type_1)
	(pred_4 ?v6 - type_5 ?v5 - type_5)
	(pred_3 ?v1 - type_3)
	(pred_6 ?v1 - type_3))                                                                                           
(:action op_1 
        :parameters (?v4 - type_5 ?v3 - type_5 ?v2 - type_4)
        :precondition (and (pred_1 ?v2 ?v4) 
                           (pred_4 ?v4 ?v3))                                                          
        :effect (and (not (pred_1 ?v2 ?v4)) (pred_1 ?v2 ?v3)))

(:action op_3 
        :parameters (?v7 - type_5 ?v8 - type_1 ?v2 - type_4)
        :precondition (and (pred_1 ?v2 ?v7) 
                           (pred_1 ?v8 ?v7))
        :effect (and (not (pred_1 ?v8 ?v7))
                     (pred_2 ?v2 ?v8)))

(:action op_2 
        :parameters (?v7 - type_5 ?v8 - type_1 ?v2 - type_4 ?v1 - type_3)
        :precondition (and (pred_1 ?v2 ?v7) 
		      	   (pred_1 ?v1 ?v7)
			   (pred_2 ?v2 ?v8)
			   (pred_5 ?v8)
			   (pred_6 ?v1))
        :effect (and (not (pred_6 ?v1))(not (pred_5 ?v8)) (pred_3 ?v1)))
)