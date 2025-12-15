(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_5 - object
	type_2 type_1 type_4 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_4 ?v8 - type_5 ?v5 - type_3)
	(pred_1 ?v8 - type_2 ?v3 - type_4)
	(pred_5 ?v3 - type_4)
	(pred_6 ?v7 - type_3 ?v1 - type_3)
	(pred_3 ?v4 - type_1)
	(pred_2 ?v4 - type_1))                                                                                           
(:action op_1 
        :parameters (?v2 - type_3 ?v6 - type_3 ?v8 - type_2)
        :precondition (and (pred_4 ?v8 ?v2) 
                           (pred_6 ?v2 ?v6))                                                          
        :effect (and (not (pred_4 ?v8 ?v2)) (pred_4 ?v8 ?v6)))

(:action op_2 
        :parameters (?v5 - type_3 ?v3 - type_4 ?v8 - type_2)
        :precondition (and (pred_4 ?v8 ?v5) 
                           (pred_4 ?v3 ?v5))
        :effect (and (not (pred_4 ?v3 ?v5))
                     (pred_1 ?v8 ?v3)))

(:action op_3 
        :parameters (?v5 - type_3 ?v3 - type_4 ?v8 - type_2 ?v4 - type_1)
        :precondition (and (pred_4 ?v8 ?v5) 
		      	   (pred_4 ?v4 ?v5)
			   (pred_1 ?v8 ?v3)
			   (pred_5 ?v3)
			   (pred_2 ?v4))
        :effect (and (not (pred_2 ?v4))(not (pred_5 ?v3)) (pred_3 ?v4)))
)