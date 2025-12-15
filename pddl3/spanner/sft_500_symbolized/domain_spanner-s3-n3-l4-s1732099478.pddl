(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_2 - object
	type_1 type_4 type_5 - type_2	
)                                           
                                                                               
(:predicates 
	(pred_3 ?v7 - type_2 ?v4 - type_3)
	(pred_5 ?v7 - type_1 ?v8 - type_5)
	(pred_1 ?v8 - type_5)
	(pred_2 ?v6 - type_3 ?v5 - type_3)
	(pred_6 ?v1 - type_4)
	(pred_4 ?v1 - type_4))                                                                                           
(:action op_3 
        :parameters (?v2 - type_3 ?v3 - type_3 ?v7 - type_1)
        :precondition (and (pred_3 ?v7 ?v2) 
                           (pred_2 ?v2 ?v3))                                                          
        :effect (and (not (pred_3 ?v7 ?v2)) (pred_3 ?v7 ?v3)))

(:action op_1 
        :parameters (?v4 - type_3 ?v8 - type_5 ?v7 - type_1)
        :precondition (and (pred_3 ?v7 ?v4) 
                           (pred_3 ?v8 ?v4))
        :effect (and (not (pred_3 ?v8 ?v4))
                     (pred_5 ?v7 ?v8)))

(:action op_2 
        :parameters (?v4 - type_3 ?v8 - type_5 ?v7 - type_1 ?v1 - type_4)
        :precondition (and (pred_3 ?v7 ?v4) 
		      	   (pred_3 ?v1 ?v4)
			   (pred_5 ?v7 ?v8)
			   (pred_1 ?v8)
			   (pred_4 ?v1))
        :effect (and (not (pred_4 ?v1))(not (pred_1 ?v8)) (pred_6 ?v1)))
)