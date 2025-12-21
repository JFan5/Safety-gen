(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_2 type_4 - object
	type_1 type_5 type_3 - type_4	
)                                           
                                                                               
(:predicates 
	(pred_2 ?v1 - type_4 ?v4 - type_2)
	(pred_3 ?v1 - type_1 ?v6 - type_3)
	(pred_4 ?v6 - type_3)
	(pred_5 ?v7 - type_2 ?v2 - type_2)
	(pred_6 ?v5 - type_5)
	(pred_1 ?v5 - type_5))                                                                                           
(:action op_1 
        :parameters (?v8 - type_2 ?v3 - type_2 ?v1 - type_1)
        :precondition (and (pred_2 ?v1 ?v8) 
                           (pred_5 ?v8 ?v3))                                                          
        :effect (and (not (pred_2 ?v1 ?v8)) (pred_2 ?v1 ?v3)))

(:action op_3 
        :parameters (?v4 - type_2 ?v6 - type_3 ?v1 - type_1)
        :precondition (and (pred_2 ?v1 ?v4) 
                           (pred_2 ?v6 ?v4))
        :effect (and (not (pred_2 ?v6 ?v4))
                     (pred_3 ?v1 ?v6)))

(:action op_2 
        :parameters (?v4 - type_2 ?v6 - type_3 ?v1 - type_1 ?v5 - type_5)
        :precondition (and (pred_2 ?v1 ?v4) 
		      	   (pred_2 ?v5 ?v4)
			   (pred_3 ?v1 ?v6)
			   (pred_4 ?v6)
			   (pred_1 ?v5))
        :effect (and (not (pred_1 ?v5))(not (pred_4 ?v6)) (pred_6 ?v5)))
)