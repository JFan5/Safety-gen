(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_5 - object
	type_4 type_1 type_2 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_4 ?v6 - type_5 ?v2 - type_3)
	(pred_1 ?v6 - type_4 ?v8 - type_2)
	(pred_6 ?v8 - type_2)
	(pred_2 ?v5 - type_3 ?v4 - type_3)
	(pred_3 ?v3 - type_1)
	(pred_5 ?v3 - type_1))                                                                                           
(:action op_2 
        :parameters (?v1 - type_3 ?v7 - type_3 ?v6 - type_4)
        :precondition (and (pred_4 ?v6 ?v1) 
                           (pred_2 ?v1 ?v7))                                                          
        :effect (and (not (pred_4 ?v6 ?v1)) (pred_4 ?v6 ?v7)))

(:action op_1 
        :parameters (?v2 - type_3 ?v8 - type_2 ?v6 - type_4)
        :precondition (and (pred_4 ?v6 ?v2) 
                           (pred_4 ?v8 ?v2))
        :effect (and (not (pred_4 ?v8 ?v2))
                     (pred_1 ?v6 ?v8)))

(:action op_3 
        :parameters (?v2 - type_3 ?v8 - type_2 ?v6 - type_4 ?v3 - type_1)
        :precondition (and (pred_4 ?v6 ?v2) 
		      	   (pred_4 ?v3 ?v2)
			   (pred_1 ?v6 ?v8)
			   (pred_6 ?v8)
			   (pred_5 ?v3))
        :effect (and (not (pred_5 ?v3))(not (pred_6 ?v8)) (pred_3 ?v3)))
)