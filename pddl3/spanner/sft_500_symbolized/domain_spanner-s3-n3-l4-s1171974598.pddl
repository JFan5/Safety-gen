(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_2 - object
	type_5 type_1 type_4 - type_2	
)                                           
                                                                               
(:predicates 
	(pred_6 ?v1 - type_2 ?v7 - type_3)
	(pred_3 ?v1 - type_5 ?v3 - type_4)
	(pred_1 ?v3 - type_4)
	(pred_2 ?v5 - type_3 ?v6 - type_3)
	(pred_5 ?v8 - type_1)
	(pred_4 ?v8 - type_1))                                                                                           
(:action op_2 
        :parameters (?v4 - type_3 ?v2 - type_3 ?v1 - type_5)
        :precondition (and (pred_6 ?v1 ?v4) 
                           (pred_2 ?v4 ?v2))                                                          
        :effect (and (not (pred_6 ?v1 ?v4)) (pred_6 ?v1 ?v2)))

(:action op_3 
        :parameters (?v7 - type_3 ?v3 - type_4 ?v1 - type_5)
        :precondition (and (pred_6 ?v1 ?v7) 
                           (pred_6 ?v3 ?v7))
        :effect (and (not (pred_6 ?v3 ?v7))
                     (pred_3 ?v1 ?v3)))

(:action op_1 
        :parameters (?v7 - type_3 ?v3 - type_4 ?v1 - type_5 ?v8 - type_1)
        :precondition (and (pred_6 ?v1 ?v7) 
		      	   (pred_6 ?v8 ?v7)
			   (pred_3 ?v1 ?v3)
			   (pred_1 ?v3)
			   (pred_4 ?v8))
        :effect (and (not (pred_4 ?v8))(not (pred_1 ?v3)) (pred_5 ?v8)))
)