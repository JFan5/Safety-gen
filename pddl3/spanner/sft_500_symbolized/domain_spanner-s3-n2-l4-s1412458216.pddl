(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_5 type_1 - object
	type_2 type_4 type_3 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_2 ?v8 - type_1 ?v4 - type_5)
	(pred_4 ?v8 - type_2 ?v1 - type_3)
	(pred_6 ?v1 - type_3)
	(pred_5 ?v3 - type_5 ?v7 - type_5)
	(pred_3 ?v5 - type_4)
	(pred_1 ?v5 - type_4))                                                                                           
(:action op_3 
        :parameters (?v2 - type_5 ?v6 - type_5 ?v8 - type_2)
        :precondition (and (pred_2 ?v8 ?v2) 
                           (pred_5 ?v2 ?v6))                                                          
        :effect (and (not (pred_2 ?v8 ?v2)) (pred_2 ?v8 ?v6)))

(:action op_1 
        :parameters (?v4 - type_5 ?v1 - type_3 ?v8 - type_2)
        :precondition (and (pred_2 ?v8 ?v4) 
                           (pred_2 ?v1 ?v4))
        :effect (and (not (pred_2 ?v1 ?v4))
                     (pred_4 ?v8 ?v1)))

(:action op_2 
        :parameters (?v4 - type_5 ?v1 - type_3 ?v8 - type_2 ?v5 - type_4)
        :precondition (and (pred_2 ?v8 ?v4) 
		      	   (pred_2 ?v5 ?v4)
			   (pred_4 ?v8 ?v1)
			   (pred_6 ?v1)
			   (pred_1 ?v5))
        :effect (and (not (pred_1 ?v5))(not (pred_6 ?v1)) (pred_3 ?v5)))
)