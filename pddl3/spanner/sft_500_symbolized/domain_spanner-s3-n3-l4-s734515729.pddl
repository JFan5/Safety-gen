(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_1 type_5 - object
	type_2 type_4 type_3 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_3 ?v5 - type_5 ?v6 - type_1)
	(pred_4 ?v5 - type_2 ?v8 - type_3)
	(pred_1 ?v8 - type_3)
	(pred_5 ?v2 - type_1 ?v7 - type_1)
	(pred_6 ?v4 - type_4)
	(pred_2 ?v4 - type_4))                                                                                           
(:action op_2 
        :parameters (?v3 - type_1 ?v1 - type_1 ?v5 - type_2)
        :precondition (and (pred_3 ?v5 ?v3) 
                           (pred_5 ?v3 ?v1))                                                          
        :effect (and (not (pred_3 ?v5 ?v3)) (pred_3 ?v5 ?v1)))

(:action op_3 
        :parameters (?v6 - type_1 ?v8 - type_3 ?v5 - type_2)
        :precondition (and (pred_3 ?v5 ?v6) 
                           (pred_3 ?v8 ?v6))
        :effect (and (not (pred_3 ?v8 ?v6))
                     (pred_4 ?v5 ?v8)))

(:action op_1 
        :parameters (?v6 - type_1 ?v8 - type_3 ?v5 - type_2 ?v4 - type_4)
        :precondition (and (pred_3 ?v5 ?v6) 
		      	   (pred_3 ?v4 ?v6)
			   (pred_4 ?v5 ?v8)
			   (pred_1 ?v8)
			   (pred_2 ?v4))
        :effect (and (not (pred_2 ?v4))(not (pred_1 ?v8)) (pred_6 ?v4)))
)