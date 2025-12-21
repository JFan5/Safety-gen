(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_5 type_2 - object
	type_1 type_3 type_4 - type_2	
)                                           
                                                                               
(:predicates 
	(pred_6 ?v3 - type_2 ?v4 - type_5)
	(pred_1 ?v3 - type_1 ?v8 - type_4)
	(pred_5 ?v8 - type_4)
	(pred_3 ?v6 - type_5 ?v5 - type_5)
	(pred_4 ?v2 - type_3)
	(pred_2 ?v2 - type_3))                                                                                           
(:action op_1 
        :parameters (?v7 - type_5 ?v1 - type_5 ?v3 - type_1)
        :precondition (and (pred_6 ?v3 ?v7) 
                           (pred_3 ?v7 ?v1))                                                          
        :effect (and (not (pred_6 ?v3 ?v7)) (pred_6 ?v3 ?v1)))

(:action op_2 
        :parameters (?v4 - type_5 ?v8 - type_4 ?v3 - type_1)
        :precondition (and (pred_6 ?v3 ?v4) 
                           (pred_6 ?v8 ?v4))
        :effect (and (not (pred_6 ?v8 ?v4))
                     (pred_1 ?v3 ?v8)))

(:action op_3 
        :parameters (?v4 - type_5 ?v8 - type_4 ?v3 - type_1 ?v2 - type_3)
        :precondition (and (pred_6 ?v3 ?v4) 
		      	   (pred_6 ?v2 ?v4)
			   (pred_1 ?v3 ?v8)
			   (pred_5 ?v8)
			   (pred_2 ?v2))
        :effect (and (not (pred_2 ?v2))(not (pred_5 ?v8)) (pred_4 ?v2)))
)