(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_2 type_5 - object
	type_1 type_3 type_4 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_2 ?v1 - type_5 ?v4 - type_2)
	(pred_1 ?v1 - type_1 ?v5 - type_4)
	(pred_4 ?v5 - type_4)
	(pred_3 ?v2 - type_2 ?v6 - type_2)
	(pred_5 ?v8 - type_3)
	(pred_6 ?v8 - type_3))                                                                                           
(:action op_2 
        :parameters (?v3 - type_2 ?v7 - type_2 ?v1 - type_1)
        :precondition (and (pred_2 ?v1 ?v3) 
                           (pred_3 ?v3 ?v7))                                                          
        :effect (and (not (pred_2 ?v1 ?v3)) (pred_2 ?v1 ?v7)))

(:action op_1 
        :parameters (?v4 - type_2 ?v5 - type_4 ?v1 - type_1)
        :precondition (and (pred_2 ?v1 ?v4) 
                           (pred_2 ?v5 ?v4))
        :effect (and (not (pred_2 ?v5 ?v4))
                     (pred_1 ?v1 ?v5)))

(:action op_3 
        :parameters (?v4 - type_2 ?v5 - type_4 ?v1 - type_1 ?v8 - type_3)
        :precondition (and (pred_2 ?v1 ?v4) 
		      	   (pred_2 ?v8 ?v4)
			   (pred_1 ?v1 ?v5)
			   (pred_4 ?v5)
			   (pred_6 ?v8))
        :effect (and (not (pred_6 ?v8))(not (pred_4 ?v5)) (pred_5 ?v8)))
)