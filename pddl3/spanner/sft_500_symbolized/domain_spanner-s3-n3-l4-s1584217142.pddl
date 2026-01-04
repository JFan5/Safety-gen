(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_2 type_3 - object
	type_1 type_4 type_5 - type_3	
)                                           
                                                                               
(:predicates 
	(pred_1 ?v6 - type_3 ?v8 - type_2)
	(pred_6 ?v6 - type_1 ?v5 - type_5)
	(pred_3 ?v5 - type_5)
	(pred_5 ?v7 - type_2 ?v1 - type_2)
	(pred_2 ?v2 - type_4)
	(pred_4 ?v2 - type_4))                                                                                           
(:action op_2 
        :parameters (?v4 - type_2 ?v3 - type_2 ?v6 - type_1)
        :precondition (and (pred_1 ?v6 ?v4) 
                           (pred_5 ?v4 ?v3))                                                          
        :effect (and (not (pred_1 ?v6 ?v4)) (pred_1 ?v6 ?v3)))

(:action op_3 
        :parameters (?v8 - type_2 ?v5 - type_5 ?v6 - type_1)
        :precondition (and (pred_1 ?v6 ?v8) 
                           (pred_1 ?v5 ?v8))
        :effect (and (not (pred_1 ?v5 ?v8))
                     (pred_6 ?v6 ?v5)))

(:action op_1 
        :parameters (?v8 - type_2 ?v5 - type_5 ?v6 - type_1 ?v2 - type_4)
        :precondition (and (pred_1 ?v6 ?v8) 
		      	   (pred_1 ?v2 ?v8)
			   (pred_6 ?v6 ?v5)
			   (pred_3 ?v5)
			   (pred_4 ?v2))
        :effect (and (not (pred_4 ?v2))(not (pred_3 ?v5)) (pred_2 ?v2)))
)