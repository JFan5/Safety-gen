(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_4 type_1 - object
	type_2 type_3 type_5 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_1 ?v7 - type_1 ?v8 - type_4)
	(pred_5 ?v7 - type_2 ?v6 - type_5)
	(pred_3 ?v6 - type_5)
	(pred_6 ?v5 - type_4 ?v1 - type_4)
	(pred_2 ?v2 - type_3)
	(pred_4 ?v2 - type_3))                                                                                           
(:action op_2 
        :parameters (?v3 - type_4 ?v4 - type_4 ?v7 - type_2)
        :precondition (and (pred_1 ?v7 ?v3) 
                           (pred_6 ?v3 ?v4))                                                          
        :effect (and (not (pred_1 ?v7 ?v3)) (pred_1 ?v7 ?v4)))

(:action op_1 
        :parameters (?v8 - type_4 ?v6 - type_5 ?v7 - type_2)
        :precondition (and (pred_1 ?v7 ?v8) 
                           (pred_1 ?v6 ?v8))
        :effect (and (not (pred_1 ?v6 ?v8))
                     (pred_5 ?v7 ?v6)))

(:action op_3 
        :parameters (?v8 - type_4 ?v6 - type_5 ?v7 - type_2 ?v2 - type_3)
        :precondition (and (pred_1 ?v7 ?v8) 
		      	   (pred_1 ?v2 ?v8)
			   (pred_5 ?v7 ?v6)
			   (pred_3 ?v6)
			   (pred_4 ?v2))
        :effect (and (not (pred_4 ?v2))(not (pred_3 ?v6)) (pred_2 ?v2)))
)