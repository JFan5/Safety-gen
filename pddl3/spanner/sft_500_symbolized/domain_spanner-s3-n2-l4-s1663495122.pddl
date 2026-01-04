(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_4 type_5 - object
	type_2 type_3 type_1 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_3 ?v4 - type_5 ?v1 - type_4)
	(pred_5 ?v4 - type_2 ?v8 - type_1)
	(pred_6 ?v8 - type_1)
	(pred_2 ?v3 - type_4 ?v7 - type_4)
	(pred_4 ?v6 - type_3)
	(pred_1 ?v6 - type_3))                                                                                           
(:action op_3 
        :parameters (?v5 - type_4 ?v2 - type_4 ?v4 - type_2)
        :precondition (and (pred_3 ?v4 ?v5) 
                           (pred_2 ?v5 ?v2))                                                          
        :effect (and (not (pred_3 ?v4 ?v5)) (pred_3 ?v4 ?v2)))

(:action op_1 
        :parameters (?v1 - type_4 ?v8 - type_1 ?v4 - type_2)
        :precondition (and (pred_3 ?v4 ?v1) 
                           (pred_3 ?v8 ?v1))
        :effect (and (not (pred_3 ?v8 ?v1))
                     (pred_5 ?v4 ?v8)))

(:action op_2 
        :parameters (?v1 - type_4 ?v8 - type_1 ?v4 - type_2 ?v6 - type_3)
        :precondition (and (pred_3 ?v4 ?v1) 
		      	   (pred_3 ?v6 ?v1)
			   (pred_5 ?v4 ?v8)
			   (pred_6 ?v8)
			   (pred_1 ?v6))
        :effect (and (not (pred_1 ?v6))(not (pred_6 ?v8)) (pred_4 ?v6)))
)