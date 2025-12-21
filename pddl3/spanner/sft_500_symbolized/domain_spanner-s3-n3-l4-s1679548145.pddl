(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_4 type_3 - object
	type_2 type_1 type_5 - type_3	
)                                           
                                                                               
(:predicates 
	(pred_6 ?v4 - type_3 ?v8 - type_4)
	(pred_1 ?v4 - type_2 ?v5 - type_5)
	(pred_4 ?v5 - type_5)
	(pred_3 ?v7 - type_4 ?v2 - type_4)
	(pred_5 ?v6 - type_1)
	(pred_2 ?v6 - type_1))                                                                                           
(:action op_3 
        :parameters (?v1 - type_4 ?v3 - type_4 ?v4 - type_2)
        :precondition (and (pred_6 ?v4 ?v1) 
                           (pred_3 ?v1 ?v3))                                                          
        :effect (and (not (pred_6 ?v4 ?v1)) (pred_6 ?v4 ?v3)))

(:action op_1 
        :parameters (?v8 - type_4 ?v5 - type_5 ?v4 - type_2)
        :precondition (and (pred_6 ?v4 ?v8) 
                           (pred_6 ?v5 ?v8))
        :effect (and (not (pred_6 ?v5 ?v8))
                     (pred_1 ?v4 ?v5)))

(:action op_2 
        :parameters (?v8 - type_4 ?v5 - type_5 ?v4 - type_2 ?v6 - type_1)
        :precondition (and (pred_6 ?v4 ?v8) 
		      	   (pred_6 ?v6 ?v8)
			   (pred_1 ?v4 ?v5)
			   (pred_4 ?v5)
			   (pred_2 ?v6))
        :effect (and (not (pred_2 ?v6))(not (pred_4 ?v5)) (pred_5 ?v6)))
)