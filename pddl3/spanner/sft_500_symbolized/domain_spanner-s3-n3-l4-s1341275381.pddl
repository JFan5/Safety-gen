(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_4 - object
	type_5 type_2 type_1 - type_4	
)                                           
                                                                               
(:predicates 
	(pred_5 ?v4 - type_4 ?v3 - type_3)
	(pred_1 ?v4 - type_5 ?v6 - type_1)
	(pred_2 ?v6 - type_1)
	(pred_3 ?v7 - type_3 ?v1 - type_3)
	(pred_6 ?v5 - type_2)
	(pred_4 ?v5 - type_2))                                                                                           
(:action op_3 
        :parameters (?v2 - type_3 ?v8 - type_3 ?v4 - type_5)
        :precondition (and (pred_5 ?v4 ?v2) 
                           (pred_3 ?v2 ?v8))                                                          
        :effect (and (not (pred_5 ?v4 ?v2)) (pred_5 ?v4 ?v8)))

(:action op_2 
        :parameters (?v3 - type_3 ?v6 - type_1 ?v4 - type_5)
        :precondition (and (pred_5 ?v4 ?v3) 
                           (pred_5 ?v6 ?v3))
        :effect (and (not (pred_5 ?v6 ?v3))
                     (pred_1 ?v4 ?v6)))

(:action op_1 
        :parameters (?v3 - type_3 ?v6 - type_1 ?v4 - type_5 ?v5 - type_2)
        :precondition (and (pred_5 ?v4 ?v3) 
		      	   (pred_5 ?v5 ?v3)
			   (pred_1 ?v4 ?v6)
			   (pred_2 ?v6)
			   (pred_4 ?v5))
        :effect (and (not (pred_4 ?v5))(not (pred_2 ?v6)) (pred_6 ?v5)))
)