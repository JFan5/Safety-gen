(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_5 type_4 - object
	type_2 type_3 type_1 - type_4	
)                                           
                                                                               
(:predicates 
	(pred_2 ?v3 - type_4 ?v4 - type_5)
	(pred_6 ?v3 - type_2 ?v6 - type_1)
	(pred_3 ?v6 - type_1)
	(pred_4 ?v5 - type_5 ?v1 - type_5)
	(pred_5 ?v7 - type_3)
	(pred_1 ?v7 - type_3))                                                                                           
(:action op_2 
        :parameters (?v2 - type_5 ?v8 - type_5 ?v3 - type_2)
        :precondition (and (pred_2 ?v3 ?v2) 
                           (pred_4 ?v2 ?v8))                                                          
        :effect (and (not (pred_2 ?v3 ?v2)) (pred_2 ?v3 ?v8)))

(:action op_3 
        :parameters (?v4 - type_5 ?v6 - type_1 ?v3 - type_2)
        :precondition (and (pred_2 ?v3 ?v4) 
                           (pred_2 ?v6 ?v4))
        :effect (and (not (pred_2 ?v6 ?v4))
                     (pred_6 ?v3 ?v6)))

(:action op_1 
        :parameters (?v4 - type_5 ?v6 - type_1 ?v3 - type_2 ?v7 - type_3)
        :precondition (and (pred_2 ?v3 ?v4) 
		      	   (pred_2 ?v7 ?v4)
			   (pred_6 ?v3 ?v6)
			   (pred_3 ?v6)
			   (pred_1 ?v7))
        :effect (and (not (pred_1 ?v7))(not (pred_3 ?v6)) (pred_5 ?v7)))
)