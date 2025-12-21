(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_2 type_5 - object
	type_1 type_3 type_4 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_2 ?v8 - type_5 ?v1 - type_2)
	(pred_3 ?v8 - type_1 ?v5 - type_4)
	(pred_1 ?v5 - type_4)
	(pred_4 ?v2 - type_2 ?v4 - type_2)
	(pred_5 ?v7 - type_3)
	(pred_6 ?v7 - type_3))                                                                                           
(:action op_1 
        :parameters (?v3 - type_2 ?v6 - type_2 ?v8 - type_1)
        :precondition (and (pred_2 ?v8 ?v3) 
                           (pred_4 ?v3 ?v6))                                                          
        :effect (and (not (pred_2 ?v8 ?v3)) (pred_2 ?v8 ?v6)))

(:action op_3 
        :parameters (?v1 - type_2 ?v5 - type_4 ?v8 - type_1)
        :precondition (and (pred_2 ?v8 ?v1) 
                           (pred_2 ?v5 ?v1))
        :effect (and (not (pred_2 ?v5 ?v1))
                     (pred_3 ?v8 ?v5)))

(:action op_2 
        :parameters (?v1 - type_2 ?v5 - type_4 ?v8 - type_1 ?v7 - type_3)
        :precondition (and (pred_2 ?v8 ?v1) 
		      	   (pred_2 ?v7 ?v1)
			   (pred_3 ?v8 ?v5)
			   (pred_1 ?v5)
			   (pred_6 ?v7))
        :effect (and (not (pred_6 ?v7))(not (pred_1 ?v5)) (pred_5 ?v7)))
)