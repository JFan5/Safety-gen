(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_5 type_3 - object
	type_1 type_4 type_2 - type_3	
)                                           
                                                                               
(:predicates 
	(pred_4 ?v5 - type_3 ?v1 - type_5)
	(pred_3 ?v5 - type_1 ?v6 - type_2)
	(pred_1 ?v6 - type_2)
	(pred_6 ?v2 - type_5 ?v3 - type_5)
	(pred_5 ?v8 - type_4)
	(pred_2 ?v8 - type_4))                                                                                           
(:action op_2 
        :parameters (?v4 - type_5 ?v7 - type_5 ?v5 - type_1)
        :precondition (and (pred_4 ?v5 ?v4) 
                           (pred_6 ?v4 ?v7))                                                          
        :effect (and (not (pred_4 ?v5 ?v4)) (pred_4 ?v5 ?v7)))

(:action op_1 
        :parameters (?v1 - type_5 ?v6 - type_2 ?v5 - type_1)
        :precondition (and (pred_4 ?v5 ?v1) 
                           (pred_4 ?v6 ?v1))
        :effect (and (not (pred_4 ?v6 ?v1))
                     (pred_3 ?v5 ?v6)))

(:action op_3 
        :parameters (?v1 - type_5 ?v6 - type_2 ?v5 - type_1 ?v8 - type_4)
        :precondition (and (pred_4 ?v5 ?v1) 
		      	   (pred_4 ?v8 ?v1)
			   (pred_3 ?v5 ?v6)
			   (pred_1 ?v6)
			   (pred_2 ?v8))
        :effect (and (not (pred_2 ?v8))(not (pred_1 ?v6)) (pred_5 ?v8)))
)