(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_5 type_3 - object
	type_4 type_1 type_2 - type_3	
)                                           
                                                                               
(:predicates 
	(pred_5 ?v6 - type_3 ?v1 - type_5)
	(pred_3 ?v6 - type_4 ?v8 - type_2)
	(pred_4 ?v8 - type_2)
	(pred_1 ?v2 - type_5 ?v4 - type_5)
	(pred_6 ?v5 - type_1)
	(pred_2 ?v5 - type_1))                                                                                           
(:action op_2 
        :parameters (?v7 - type_5 ?v3 - type_5 ?v6 - type_4)
        :precondition (and (pred_5 ?v6 ?v7) 
                           (pred_1 ?v7 ?v3))                                                          
        :effect (and (not (pred_5 ?v6 ?v7)) (pred_5 ?v6 ?v3)))

(:action op_1 
        :parameters (?v1 - type_5 ?v8 - type_2 ?v6 - type_4)
        :precondition (and (pred_5 ?v6 ?v1) 
                           (pred_5 ?v8 ?v1))
        :effect (and (not (pred_5 ?v8 ?v1))
                     (pred_3 ?v6 ?v8)))

(:action op_3 
        :parameters (?v1 - type_5 ?v8 - type_2 ?v6 - type_4 ?v5 - type_1)
        :precondition (and (pred_5 ?v6 ?v1) 
		      	   (pred_5 ?v5 ?v1)
			   (pred_3 ?v6 ?v8)
			   (pred_4 ?v8)
			   (pred_2 ?v5))
        :effect (and (not (pred_2 ?v5))(not (pred_4 ?v8)) (pred_6 ?v5)))
)