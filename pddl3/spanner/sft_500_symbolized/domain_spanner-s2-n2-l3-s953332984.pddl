(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_4 type_5 - object
	type_3 type_1 type_2 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_5 ?v5 - type_5 ?v8 - type_4)
	(pred_2 ?v5 - type_3 ?v6 - type_2)
	(pred_1 ?v6 - type_2)
	(pred_3 ?v4 - type_4 ?v1 - type_4)
	(pred_4 ?v2 - type_1)
	(pred_6 ?v2 - type_1))                                                                                           
(:action op_1 
        :parameters (?v7 - type_4 ?v3 - type_4 ?v5 - type_3)
        :precondition (and (pred_5 ?v5 ?v7) 
                           (pred_3 ?v7 ?v3))                                                          
        :effect (and (not (pred_5 ?v5 ?v7)) (pred_5 ?v5 ?v3)))

(:action op_2 
        :parameters (?v8 - type_4 ?v6 - type_2 ?v5 - type_3)
        :precondition (and (pred_5 ?v5 ?v8) 
                           (pred_5 ?v6 ?v8))
        :effect (and (not (pred_5 ?v6 ?v8))
                     (pred_2 ?v5 ?v6)))

(:action op_3 
        :parameters (?v8 - type_4 ?v6 - type_2 ?v5 - type_3 ?v2 - type_1)
        :precondition (and (pred_5 ?v5 ?v8) 
		      	   (pred_5 ?v2 ?v8)
			   (pred_2 ?v5 ?v6)
			   (pred_1 ?v6)
			   (pred_6 ?v2))
        :effect (and (not (pred_6 ?v2))(not (pred_1 ?v6)) (pred_4 ?v2)))
)