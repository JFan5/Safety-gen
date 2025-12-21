(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_1 type_5 - object
	type_3 type_2 type_4 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_6 ?v6 - type_5 ?v1 - type_1)
	(pred_1 ?v6 - type_3 ?v8 - type_4)
	(pred_2 ?v8 - type_4)
	(pred_3 ?v3 - type_1 ?v4 - type_1)
	(pred_4 ?v5 - type_2)
	(pred_5 ?v5 - type_2))                                                                                           
(:action op_2 
        :parameters (?v7 - type_1 ?v2 - type_1 ?v6 - type_3)
        :precondition (and (pred_6 ?v6 ?v7) 
                           (pred_3 ?v7 ?v2))                                                          
        :effect (and (not (pred_6 ?v6 ?v7)) (pred_6 ?v6 ?v2)))

(:action op_3 
        :parameters (?v1 - type_1 ?v8 - type_4 ?v6 - type_3)
        :precondition (and (pred_6 ?v6 ?v1) 
                           (pred_6 ?v8 ?v1))
        :effect (and (not (pred_6 ?v8 ?v1))
                     (pred_1 ?v6 ?v8)))

(:action op_1 
        :parameters (?v1 - type_1 ?v8 - type_4 ?v6 - type_3 ?v5 - type_2)
        :precondition (and (pred_6 ?v6 ?v1) 
		      	   (pred_6 ?v5 ?v1)
			   (pred_1 ?v6 ?v8)
			   (pred_2 ?v8)
			   (pred_5 ?v5))
        :effect (and (not (pred_5 ?v5))(not (pred_2 ?v8)) (pred_4 ?v5)))
)