(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_4 type_3 - object
	type_5 type_1 type_2 - type_3	
)                                           
                                                                               
(:predicates 
	(pred_1 ?v6 - type_3 ?v1 - type_4)
	(pred_4 ?v6 - type_5 ?v8 - type_2)
	(pred_2 ?v8 - type_2)
	(pred_3 ?v5 - type_4 ?v2 - type_4)
	(pred_6 ?v4 - type_1)
	(pred_5 ?v4 - type_1))                                                                                           
(:action op_1 
        :parameters (?v3 - type_4 ?v7 - type_4 ?v6 - type_5)
        :precondition (and (pred_1 ?v6 ?v3) 
                           (pred_3 ?v3 ?v7))                                                          
        :effect (and (not (pred_1 ?v6 ?v3)) (pred_1 ?v6 ?v7)))

(:action op_3 
        :parameters (?v1 - type_4 ?v8 - type_2 ?v6 - type_5)
        :precondition (and (pred_1 ?v6 ?v1) 
                           (pred_1 ?v8 ?v1))
        :effect (and (not (pred_1 ?v8 ?v1))
                     (pred_4 ?v6 ?v8)))

(:action op_2 
        :parameters (?v1 - type_4 ?v8 - type_2 ?v6 - type_5 ?v4 - type_1)
        :precondition (and (pred_1 ?v6 ?v1) 
		      	   (pred_1 ?v4 ?v1)
			   (pred_4 ?v6 ?v8)
			   (pred_2 ?v8)
			   (pred_5 ?v4))
        :effect (and (not (pred_5 ?v4))(not (pred_2 ?v8)) (pred_6 ?v4)))
)