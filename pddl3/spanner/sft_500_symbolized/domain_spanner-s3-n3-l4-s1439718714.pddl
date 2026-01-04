(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_4 type_5 - object
	type_3 type_1 type_2 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_4 ?v4 - type_5 ?v2 - type_4)
	(pred_5 ?v4 - type_3 ?v8 - type_2)
	(pred_1 ?v8 - type_2)
	(pred_2 ?v1 - type_4 ?v3 - type_4)
	(pred_6 ?v6 - type_1)
	(pred_3 ?v6 - type_1))                                                                                           
(:action op_2 
        :parameters (?v7 - type_4 ?v5 - type_4 ?v4 - type_3)
        :precondition (and (pred_4 ?v4 ?v7) 
                           (pred_2 ?v7 ?v5))                                                          
        :effect (and (not (pred_4 ?v4 ?v7)) (pred_4 ?v4 ?v5)))

(:action op_3 
        :parameters (?v2 - type_4 ?v8 - type_2 ?v4 - type_3)
        :precondition (and (pred_4 ?v4 ?v2) 
                           (pred_4 ?v8 ?v2))
        :effect (and (not (pred_4 ?v8 ?v2))
                     (pred_5 ?v4 ?v8)))

(:action op_1 
        :parameters (?v2 - type_4 ?v8 - type_2 ?v4 - type_3 ?v6 - type_1)
        :precondition (and (pred_4 ?v4 ?v2) 
		      	   (pred_4 ?v6 ?v2)
			   (pred_5 ?v4 ?v8)
			   (pred_1 ?v8)
			   (pred_3 ?v6))
        :effect (and (not (pred_3 ?v6))(not (pred_1 ?v8)) (pred_6 ?v6)))
)