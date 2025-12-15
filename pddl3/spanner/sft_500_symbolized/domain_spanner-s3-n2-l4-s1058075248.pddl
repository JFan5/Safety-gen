(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_2 type_1 - object
	type_3 type_4 type_5 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_1 ?v8 - type_1 ?v6 - type_2)
	(pred_4 ?v8 - type_3 ?v4 - type_5)
	(pred_6 ?v4 - type_5)
	(pred_2 ?v2 - type_2 ?v7 - type_2)
	(pred_3 ?v1 - type_4)
	(pred_5 ?v1 - type_4))                                                                                           
(:action op_1 
        :parameters (?v3 - type_2 ?v5 - type_2 ?v8 - type_3)
        :precondition (and (pred_1 ?v8 ?v3) 
                           (pred_2 ?v3 ?v5))                                                          
        :effect (and (not (pred_1 ?v8 ?v3)) (pred_1 ?v8 ?v5)))

(:action op_3 
        :parameters (?v6 - type_2 ?v4 - type_5 ?v8 - type_3)
        :precondition (and (pred_1 ?v8 ?v6) 
                           (pred_1 ?v4 ?v6))
        :effect (and (not (pred_1 ?v4 ?v6))
                     (pred_4 ?v8 ?v4)))

(:action op_2 
        :parameters (?v6 - type_2 ?v4 - type_5 ?v8 - type_3 ?v1 - type_4)
        :precondition (and (pred_1 ?v8 ?v6) 
		      	   (pred_1 ?v1 ?v6)
			   (pred_4 ?v8 ?v4)
			   (pred_6 ?v4)
			   (pred_5 ?v1))
        :effect (and (not (pred_5 ?v1))(not (pred_6 ?v4)) (pred_3 ?v1)))
)