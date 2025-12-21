(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_4 type_5 - object
	type_2 type_1 type_3 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_4 ?v3 - type_5 ?v2 - type_4)
	(pred_1 ?v3 - type_2 ?v6 - type_3)
	(pred_3 ?v6 - type_3)
	(pred_6 ?v5 - type_4 ?v1 - type_4)
	(pred_2 ?v8 - type_1)
	(pred_5 ?v8 - type_1))                                                                                           
(:action op_2 
        :parameters (?v4 - type_4 ?v7 - type_4 ?v3 - type_2)
        :precondition (and (pred_4 ?v3 ?v4) 
                           (pred_6 ?v4 ?v7))                                                          
        :effect (and (not (pred_4 ?v3 ?v4)) (pred_4 ?v3 ?v7)))

(:action op_3 
        :parameters (?v2 - type_4 ?v6 - type_3 ?v3 - type_2)
        :precondition (and (pred_4 ?v3 ?v2) 
                           (pred_4 ?v6 ?v2))
        :effect (and (not (pred_4 ?v6 ?v2))
                     (pred_1 ?v3 ?v6)))

(:action op_1 
        :parameters (?v2 - type_4 ?v6 - type_3 ?v3 - type_2 ?v8 - type_1)
        :precondition (and (pred_4 ?v3 ?v2) 
		      	   (pred_4 ?v8 ?v2)
			   (pred_1 ?v3 ?v6)
			   (pred_3 ?v6)
			   (pred_5 ?v8))
        :effect (and (not (pred_5 ?v8))(not (pred_3 ?v6)) (pred_2 ?v8)))
)