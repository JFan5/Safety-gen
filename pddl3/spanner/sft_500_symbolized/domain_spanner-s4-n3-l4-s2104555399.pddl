(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_2 type_4 - object
	type_1 type_5 type_3 - type_4	
)                                           
                                                                               
(:predicates 
	(pred_4 ?v5 - type_4 ?v3 - type_2)
	(pred_2 ?v5 - type_1 ?v6 - type_3)
	(pred_1 ?v6 - type_3)
	(pred_5 ?v7 - type_2 ?v1 - type_2)
	(pred_6 ?v4 - type_5)
	(pred_3 ?v4 - type_5))                                                                                           
(:action op_1 
        :parameters (?v2 - type_2 ?v8 - type_2 ?v5 - type_1)
        :precondition (and (pred_4 ?v5 ?v2) 
                           (pred_5 ?v2 ?v8))                                                          
        :effect (and (not (pred_4 ?v5 ?v2)) (pred_4 ?v5 ?v8)))

(:action op_2 
        :parameters (?v3 - type_2 ?v6 - type_3 ?v5 - type_1)
        :precondition (and (pred_4 ?v5 ?v3) 
                           (pred_4 ?v6 ?v3))
        :effect (and (not (pred_4 ?v6 ?v3))
                     (pred_2 ?v5 ?v6)))

(:action op_3 
        :parameters (?v3 - type_2 ?v6 - type_3 ?v5 - type_1 ?v4 - type_5)
        :precondition (and (pred_4 ?v5 ?v3) 
		      	   (pred_4 ?v4 ?v3)
			   (pred_2 ?v5 ?v6)
			   (pred_1 ?v6)
			   (pred_3 ?v4))
        :effect (and (not (pred_3 ?v4))(not (pred_1 ?v6)) (pred_6 ?v4)))
)