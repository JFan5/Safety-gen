(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_1 type_5 - object
	type_2 type_4 type_3 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_5 ?v7 - type_5 ?v5 - type_1)
	(pred_6 ?v7 - type_2 ?v8 - type_3)
	(pred_1 ?v8 - type_3)
	(pred_3 ?v2 - type_1 ?v4 - type_1)
	(pred_2 ?v6 - type_4)
	(pred_4 ?v6 - type_4))                                                                                           
(:action op_1 
        :parameters (?v1 - type_1 ?v3 - type_1 ?v7 - type_2)
        :precondition (and (pred_5 ?v7 ?v1) 
                           (pred_3 ?v1 ?v3))                                                          
        :effect (and (not (pred_5 ?v7 ?v1)) (pred_5 ?v7 ?v3)))

(:action op_2 
        :parameters (?v5 - type_1 ?v8 - type_3 ?v7 - type_2)
        :precondition (and (pred_5 ?v7 ?v5) 
                           (pred_5 ?v8 ?v5))
        :effect (and (not (pred_5 ?v8 ?v5))
                     (pred_6 ?v7 ?v8)))

(:action op_3 
        :parameters (?v5 - type_1 ?v8 - type_3 ?v7 - type_2 ?v6 - type_4)
        :precondition (and (pred_5 ?v7 ?v5) 
		      	   (pred_5 ?v6 ?v5)
			   (pred_6 ?v7 ?v8)
			   (pred_1 ?v8)
			   (pred_4 ?v6))
        :effect (and (not (pred_4 ?v6))(not (pred_1 ?v8)) (pred_2 ?v6)))
)