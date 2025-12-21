(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_2 type_1 - object
	type_3 type_5 type_4 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_1 ?v2 - type_1 ?v7 - type_2)
	(pred_6 ?v2 - type_3 ?v8 - type_4)
	(pred_3 ?v8 - type_4)
	(pred_2 ?v4 - type_2 ?v3 - type_2)
	(pred_5 ?v5 - type_5)
	(pred_4 ?v5 - type_5))                                                                                           
(:action op_3 
        :parameters (?v1 - type_2 ?v6 - type_2 ?v2 - type_3)
        :precondition (and (pred_1 ?v2 ?v1) 
                           (pred_2 ?v1 ?v6))                                                          
        :effect (and (not (pred_1 ?v2 ?v1)) (pred_1 ?v2 ?v6)))

(:action op_2 
        :parameters (?v7 - type_2 ?v8 - type_4 ?v2 - type_3)
        :precondition (and (pred_1 ?v2 ?v7) 
                           (pred_1 ?v8 ?v7))
        :effect (and (not (pred_1 ?v8 ?v7))
                     (pred_6 ?v2 ?v8)))

(:action op_1 
        :parameters (?v7 - type_2 ?v8 - type_4 ?v2 - type_3 ?v5 - type_5)
        :precondition (and (pred_1 ?v2 ?v7) 
		      	   (pred_1 ?v5 ?v7)
			   (pred_6 ?v2 ?v8)
			   (pred_3 ?v8)
			   (pred_4 ?v5))
        :effect (and (not (pred_4 ?v5))(not (pred_3 ?v8)) (pred_5 ?v5)))
)