(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_5 type_3 - object
	type_1 type_4 type_2 - type_3	
)                                           
                                                                               
(:predicates 
	(pred_1 ?v3 - type_3 ?v7 - type_5)
	(pred_6 ?v3 - type_1 ?v2 - type_2)
	(pred_4 ?v2 - type_2)
	(pred_2 ?v4 - type_5 ?v6 - type_5)
	(pred_3 ?v1 - type_4)
	(pred_5 ?v1 - type_4))                                                                                           
(:action op_1 
        :parameters (?v8 - type_5 ?v5 - type_5 ?v3 - type_1)
        :precondition (and (pred_1 ?v3 ?v8) 
                           (pred_2 ?v8 ?v5))                                                          
        :effect (and (not (pred_1 ?v3 ?v8)) (pred_1 ?v3 ?v5)))

(:action op_3 
        :parameters (?v7 - type_5 ?v2 - type_2 ?v3 - type_1)
        :precondition (and (pred_1 ?v3 ?v7) 
                           (pred_1 ?v2 ?v7))
        :effect (and (not (pred_1 ?v2 ?v7))
                     (pred_6 ?v3 ?v2)))

(:action op_2 
        :parameters (?v7 - type_5 ?v2 - type_2 ?v3 - type_1 ?v1 - type_4)
        :precondition (and (pred_1 ?v3 ?v7) 
		      	   (pred_1 ?v1 ?v7)
			   (pred_6 ?v3 ?v2)
			   (pred_4 ?v2)
			   (pred_5 ?v1))
        :effect (and (not (pred_5 ?v1))(not (pred_4 ?v2)) (pred_3 ?v1)))
)