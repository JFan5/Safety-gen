(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_2 type_5 - object
	type_3 type_4 type_1 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_1 ?v8 - type_5 ?v2 - type_2)
	(pred_6 ?v8 - type_3 ?v5 - type_1)
	(pred_2 ?v5 - type_1)
	(pred_3 ?v1 - type_2 ?v4 - type_2)
	(pred_5 ?v3 - type_4)
	(pred_4 ?v3 - type_4))                                                                                           
(:action op_3 
        :parameters (?v7 - type_2 ?v6 - type_2 ?v8 - type_3)
        :precondition (and (pred_1 ?v8 ?v7) 
                           (pred_3 ?v7 ?v6))                                                          
        :effect (and (not (pred_1 ?v8 ?v7)) (pred_1 ?v8 ?v6)))

(:action op_2 
        :parameters (?v2 - type_2 ?v5 - type_1 ?v8 - type_3)
        :precondition (and (pred_1 ?v8 ?v2) 
                           (pred_1 ?v5 ?v2))
        :effect (and (not (pred_1 ?v5 ?v2))
                     (pred_6 ?v8 ?v5)))

(:action op_1 
        :parameters (?v2 - type_2 ?v5 - type_1 ?v8 - type_3 ?v3 - type_4)
        :precondition (and (pred_1 ?v8 ?v2) 
		      	   (pred_1 ?v3 ?v2)
			   (pred_6 ?v8 ?v5)
			   (pred_2 ?v5)
			   (pred_4 ?v3))
        :effect (and (not (pred_4 ?v3))(not (pred_2 ?v5)) (pred_5 ?v3)))
)