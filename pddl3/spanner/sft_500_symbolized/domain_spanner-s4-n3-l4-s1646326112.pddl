(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_5 type_4 - object
	type_2 type_1 type_3 - type_4	
)                                           
                                                                               
(:predicates 
	(pred_2 ?v6 - type_4 ?v1 - type_5)
	(pred_4 ?v6 - type_2 ?v8 - type_3)
	(pred_6 ?v8 - type_3)
	(pred_3 ?v4 - type_5 ?v2 - type_5)
	(pred_1 ?v7 - type_1)
	(pred_5 ?v7 - type_1))                                                                                           
(:action op_3 
        :parameters (?v3 - type_5 ?v5 - type_5 ?v6 - type_2)
        :precondition (and (pred_2 ?v6 ?v3) 
                           (pred_3 ?v3 ?v5))                                                          
        :effect (and (not (pred_2 ?v6 ?v3)) (pred_2 ?v6 ?v5)))

(:action op_2 
        :parameters (?v1 - type_5 ?v8 - type_3 ?v6 - type_2)
        :precondition (and (pred_2 ?v6 ?v1) 
                           (pred_2 ?v8 ?v1))
        :effect (and (not (pred_2 ?v8 ?v1))
                     (pred_4 ?v6 ?v8)))

(:action op_1 
        :parameters (?v1 - type_5 ?v8 - type_3 ?v6 - type_2 ?v7 - type_1)
        :precondition (and (pred_2 ?v6 ?v1) 
		      	   (pred_2 ?v7 ?v1)
			   (pred_4 ?v6 ?v8)
			   (pred_6 ?v8)
			   (pred_5 ?v7))
        :effect (and (not (pred_5 ?v7))(not (pred_6 ?v8)) (pred_1 ?v7)))
)