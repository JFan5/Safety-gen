(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_5 type_1 - object
	type_2 type_3 type_4 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_2 ?v3 - type_1 ?v2 - type_5)
	(pred_5 ?v3 - type_2 ?v6 - type_4)
	(pred_1 ?v6 - type_4)
	(pred_4 ?v1 - type_5 ?v4 - type_5)
	(pred_6 ?v8 - type_3)
	(pred_3 ?v8 - type_3))                                                                                           
(:action op_2 
        :parameters (?v7 - type_5 ?v5 - type_5 ?v3 - type_2)
        :precondition (and (pred_2 ?v3 ?v7) 
                           (pred_4 ?v7 ?v5))                                                          
        :effect (and (not (pred_2 ?v3 ?v7)) (pred_2 ?v3 ?v5)))

(:action op_3 
        :parameters (?v2 - type_5 ?v6 - type_4 ?v3 - type_2)
        :precondition (and (pred_2 ?v3 ?v2) 
                           (pred_2 ?v6 ?v2))
        :effect (and (not (pred_2 ?v6 ?v2))
                     (pred_5 ?v3 ?v6)))

(:action op_1 
        :parameters (?v2 - type_5 ?v6 - type_4 ?v3 - type_2 ?v8 - type_3)
        :precondition (and (pred_2 ?v3 ?v2) 
		      	   (pred_2 ?v8 ?v2)
			   (pred_5 ?v3 ?v6)
			   (pred_1 ?v6)
			   (pred_3 ?v8))
        :effect (and (not (pred_3 ?v8))(not (pred_1 ?v6)) (pred_6 ?v8)))
)