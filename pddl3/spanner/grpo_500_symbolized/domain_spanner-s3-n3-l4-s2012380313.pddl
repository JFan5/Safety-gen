(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_2 type_1 - object
	type_4 type_3 type_5 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_5 ?v5 - type_1 ?v8 - type_2)
	(pred_2 ?v5 - type_4 ?v6 - type_5)
	(pred_3 ?v6 - type_5)
	(pred_6 ?v1 - type_2 ?v3 - type_2)
	(pred_4 ?v7 - type_3)
	(pred_1 ?v7 - type_3))                                                                                           
(:action op_1 
        :parameters (?v2 - type_2 ?v4 - type_2 ?v5 - type_4)
        :precondition (and (pred_5 ?v5 ?v2) 
                           (pred_6 ?v2 ?v4))                                                          
        :effect (and (not (pred_5 ?v5 ?v2)) (pred_5 ?v5 ?v4)))

(:action op_3 
        :parameters (?v8 - type_2 ?v6 - type_5 ?v5 - type_4)
        :precondition (and (pred_5 ?v5 ?v8) 
                           (pred_5 ?v6 ?v8))
        :effect (and (not (pred_5 ?v6 ?v8))
                     (pred_2 ?v5 ?v6)))

(:action op_2 
        :parameters (?v8 - type_2 ?v6 - type_5 ?v5 - type_4 ?v7 - type_3)
        :precondition (and (pred_5 ?v5 ?v8) 
		      	   (pred_5 ?v7 ?v8)
			   (pred_2 ?v5 ?v6)
			   (pred_3 ?v6)
			   (pred_1 ?v7))
        :effect (and (not (pred_1 ?v7))(not (pred_3 ?v6)) (pred_4 ?v7)))
)