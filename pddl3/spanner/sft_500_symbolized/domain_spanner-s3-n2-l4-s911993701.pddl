(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_5 type_3 - object
	type_4 type_2 type_1 - type_3	
)                                           
                                                                               
(:predicates 
	(pred_3 ?v5 - type_3 ?v3 - type_5)
	(pred_4 ?v5 - type_4 ?v8 - type_1)
	(pred_5 ?v8 - type_1)
	(pred_2 ?v7 - type_5 ?v4 - type_5)
	(pred_1 ?v6 - type_2)
	(pred_6 ?v6 - type_2))                                                                                           
(:action op_1 
        :parameters (?v1 - type_5 ?v2 - type_5 ?v5 - type_4)
        :precondition (and (pred_3 ?v5 ?v1) 
                           (pred_2 ?v1 ?v2))                                                          
        :effect (and (not (pred_3 ?v5 ?v1)) (pred_3 ?v5 ?v2)))

(:action op_3 
        :parameters (?v3 - type_5 ?v8 - type_1 ?v5 - type_4)
        :precondition (and (pred_3 ?v5 ?v3) 
                           (pred_3 ?v8 ?v3))
        :effect (and (not (pred_3 ?v8 ?v3))
                     (pred_4 ?v5 ?v8)))

(:action op_2 
        :parameters (?v3 - type_5 ?v8 - type_1 ?v5 - type_4 ?v6 - type_2)
        :precondition (and (pred_3 ?v5 ?v3) 
		      	   (pred_3 ?v6 ?v3)
			   (pred_4 ?v5 ?v8)
			   (pred_5 ?v8)
			   (pred_6 ?v6))
        :effect (and (not (pred_6 ?v6))(not (pred_5 ?v8)) (pred_1 ?v6)))
)