(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_2 type_3 - object
	type_4 type_5 type_1 - type_3	
)                                           
                                                                               
(:predicates 
	(pred_6 ?v5 - type_3 ?v4 - type_2)
	(pred_1 ?v5 - type_4 ?v6 - type_1)
	(pred_4 ?v6 - type_1)
	(pred_2 ?v3 - type_2 ?v2 - type_2)
	(pred_5 ?v8 - type_5)
	(pred_3 ?v8 - type_5))                                                                                           
(:action op_2 
        :parameters (?v1 - type_2 ?v7 - type_2 ?v5 - type_4)
        :precondition (and (pred_6 ?v5 ?v1) 
                           (pred_2 ?v1 ?v7))                                                          
        :effect (and (not (pred_6 ?v5 ?v1)) (pred_6 ?v5 ?v7)))

(:action op_1 
        :parameters (?v4 - type_2 ?v6 - type_1 ?v5 - type_4)
        :precondition (and (pred_6 ?v5 ?v4) 
                           (pred_6 ?v6 ?v4))
        :effect (and (not (pred_6 ?v6 ?v4))
                     (pred_1 ?v5 ?v6)))

(:action op_3 
        :parameters (?v4 - type_2 ?v6 - type_1 ?v5 - type_4 ?v8 - type_5)
        :precondition (and (pred_6 ?v5 ?v4) 
		      	   (pred_6 ?v8 ?v4)
			   (pred_1 ?v5 ?v6)
			   (pred_4 ?v6)
			   (pred_3 ?v8))
        :effect (and (not (pred_3 ?v8))(not (pred_4 ?v6)) (pred_5 ?v8)))
)