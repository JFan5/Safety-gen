(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_4 type_3 - object
	type_2 type_5 type_1 - type_3	
)                                           
                                                                               
(:predicates 
	(pred_2 ?v2 - type_3 ?v1 - type_4)
	(pred_1 ?v2 - type_2 ?v6 - type_1)
	(pred_5 ?v6 - type_1)
	(pred_4 ?v7 - type_4 ?v4 - type_4)
	(pred_3 ?v5 - type_5)
	(pred_6 ?v5 - type_5))                                                                                           
(:action op_1 
        :parameters (?v8 - type_4 ?v3 - type_4 ?v2 - type_2)
        :precondition (and (pred_2 ?v2 ?v8) 
                           (pred_4 ?v8 ?v3))                                                          
        :effect (and (not (pred_2 ?v2 ?v8)) (pred_2 ?v2 ?v3)))

(:action op_3 
        :parameters (?v1 - type_4 ?v6 - type_1 ?v2 - type_2)
        :precondition (and (pred_2 ?v2 ?v1) 
                           (pred_2 ?v6 ?v1))
        :effect (and (not (pred_2 ?v6 ?v1))
                     (pred_1 ?v2 ?v6)))

(:action op_2 
        :parameters (?v1 - type_4 ?v6 - type_1 ?v2 - type_2 ?v5 - type_5)
        :precondition (and (pred_2 ?v2 ?v1) 
		      	   (pred_2 ?v5 ?v1)
			   (pred_1 ?v2 ?v6)
			   (pred_5 ?v6)
			   (pred_6 ?v5))
        :effect (and (not (pred_6 ?v5))(not (pred_5 ?v6)) (pred_3 ?v5)))
)