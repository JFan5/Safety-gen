(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_1 - object
	type_5 type_2 type_4 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_4 ?v5 - type_1 ?v2 - type_3)
	(pred_6 ?v5 - type_5 ?v8 - type_4)
	(pred_2 ?v8 - type_4)
	(pred_1 ?v4 - type_3 ?v1 - type_3)
	(pred_3 ?v6 - type_2)
	(pred_5 ?v6 - type_2))                                                                                           
(:action op_1 
        :parameters (?v7 - type_3 ?v3 - type_3 ?v5 - type_5)
        :precondition (and (pred_4 ?v5 ?v7) 
                           (pred_1 ?v7 ?v3))                                                          
        :effect (and (not (pred_4 ?v5 ?v7)) (pred_4 ?v5 ?v3)))

(:action op_3 
        :parameters (?v2 - type_3 ?v8 - type_4 ?v5 - type_5)
        :precondition (and (pred_4 ?v5 ?v2) 
                           (pred_4 ?v8 ?v2))
        :effect (and (not (pred_4 ?v8 ?v2))
                     (pred_6 ?v5 ?v8)))

(:action op_2 
        :parameters (?v2 - type_3 ?v8 - type_4 ?v5 - type_5 ?v6 - type_2)
        :precondition (and (pred_4 ?v5 ?v2) 
		      	   (pred_4 ?v6 ?v2)
			   (pred_6 ?v5 ?v8)
			   (pred_2 ?v8)
			   (pred_5 ?v6))
        :effect (and (not (pred_5 ?v6))(not (pred_2 ?v8)) (pred_3 ?v6)))
)