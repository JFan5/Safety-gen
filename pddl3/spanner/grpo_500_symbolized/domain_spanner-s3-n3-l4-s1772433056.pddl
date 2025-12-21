(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_2 type_1 - object
	type_4 type_5 type_3 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_6 ?v6 - type_1 ?v8 - type_2)
	(pred_3 ?v6 - type_4 ?v1 - type_3)
	(pred_1 ?v1 - type_3)
	(pred_5 ?v2 - type_2 ?v5 - type_2)
	(pred_2 ?v4 - type_5)
	(pred_4 ?v4 - type_5))                                                                                           
(:action op_2 
        :parameters (?v3 - type_2 ?v7 - type_2 ?v6 - type_4)
        :precondition (and (pred_6 ?v6 ?v3) 
                           (pred_5 ?v3 ?v7))                                                          
        :effect (and (not (pred_6 ?v6 ?v3)) (pred_6 ?v6 ?v7)))

(:action op_1 
        :parameters (?v8 - type_2 ?v1 - type_3 ?v6 - type_4)
        :precondition (and (pred_6 ?v6 ?v8) 
                           (pred_6 ?v1 ?v8))
        :effect (and (not (pred_6 ?v1 ?v8))
                     (pred_3 ?v6 ?v1)))

(:action op_3 
        :parameters (?v8 - type_2 ?v1 - type_3 ?v6 - type_4 ?v4 - type_5)
        :precondition (and (pred_6 ?v6 ?v8) 
		      	   (pred_6 ?v4 ?v8)
			   (pred_3 ?v6 ?v1)
			   (pred_1 ?v1)
			   (pred_4 ?v4))
        :effect (and (not (pred_4 ?v4))(not (pred_1 ?v1)) (pred_2 ?v4)))
)