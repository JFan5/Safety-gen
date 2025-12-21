(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_4 type_2 - object
	type_3 type_1 type_5 - type_2	
)                                           
                                                                               
(:predicates 
	(pred_4 ?v3 - type_2 ?v7 - type_4)
	(pred_2 ?v3 - type_3 ?v8 - type_5)
	(pred_1 ?v8 - type_5)
	(pred_6 ?v1 - type_4 ?v6 - type_4)
	(pred_5 ?v5 - type_1)
	(pred_3 ?v5 - type_1))                                                                                           
(:action op_1 
        :parameters (?v4 - type_4 ?v2 - type_4 ?v3 - type_3)
        :precondition (and (pred_4 ?v3 ?v4) 
                           (pred_6 ?v4 ?v2))                                                          
        :effect (and (not (pred_4 ?v3 ?v4)) (pred_4 ?v3 ?v2)))

(:action op_2 
        :parameters (?v7 - type_4 ?v8 - type_5 ?v3 - type_3)
        :precondition (and (pred_4 ?v3 ?v7) 
                           (pred_4 ?v8 ?v7))
        :effect (and (not (pred_4 ?v8 ?v7))
                     (pred_2 ?v3 ?v8)))

(:action op_3 
        :parameters (?v7 - type_4 ?v8 - type_5 ?v3 - type_3 ?v5 - type_1)
        :precondition (and (pred_4 ?v3 ?v7) 
		      	   (pred_4 ?v5 ?v7)
			   (pred_2 ?v3 ?v8)
			   (pred_1 ?v8)
			   (pred_3 ?v5))
        :effect (and (not (pred_3 ?v5))(not (pred_1 ?v8)) (pred_5 ?v5)))
)