(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_1 type_4 - object
	type_3 type_5 type_2 - type_4	
)                                           
                                                                               
(:predicates 
	(pred_4 ?v2 - type_4 ?v8 - type_1)
	(pred_1 ?v2 - type_3 ?v6 - type_2)
	(pred_3 ?v6 - type_2)
	(pred_5 ?v3 - type_1 ?v4 - type_1)
	(pred_2 ?v1 - type_5)
	(pred_6 ?v1 - type_5))                                                                                           
(:action op_3 
        :parameters (?v7 - type_1 ?v5 - type_1 ?v2 - type_3)
        :precondition (and (pred_4 ?v2 ?v7) 
                           (pred_5 ?v7 ?v5))                                                          
        :effect (and (not (pred_4 ?v2 ?v7)) (pred_4 ?v2 ?v5)))

(:action op_1 
        :parameters (?v8 - type_1 ?v6 - type_2 ?v2 - type_3)
        :precondition (and (pred_4 ?v2 ?v8) 
                           (pred_4 ?v6 ?v8))
        :effect (and (not (pred_4 ?v6 ?v8))
                     (pred_1 ?v2 ?v6)))

(:action op_2 
        :parameters (?v8 - type_1 ?v6 - type_2 ?v2 - type_3 ?v1 - type_5)
        :precondition (and (pred_4 ?v2 ?v8) 
		      	   (pred_4 ?v1 ?v8)
			   (pred_1 ?v2 ?v6)
			   (pred_3 ?v6)
			   (pred_6 ?v1))
        :effect (and (not (pred_6 ?v1))(not (pred_3 ?v6)) (pred_2 ?v1)))
)