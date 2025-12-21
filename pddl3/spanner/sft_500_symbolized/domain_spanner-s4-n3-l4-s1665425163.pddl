(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_2 type_5 - object
	type_4 type_1 type_3 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_6 ?v8 - type_5 ?v3 - type_2)
	(pred_4 ?v8 - type_4 ?v1 - type_3)
	(pred_5 ?v1 - type_3)
	(pred_2 ?v4 - type_2 ?v2 - type_2)
	(pred_1 ?v5 - type_1)
	(pred_3 ?v5 - type_1))                                                                                           
(:action op_2 
        :parameters (?v7 - type_2 ?v6 - type_2 ?v8 - type_4)
        :precondition (and (pred_6 ?v8 ?v7) 
                           (pred_2 ?v7 ?v6))                                                          
        :effect (and (not (pred_6 ?v8 ?v7)) (pred_6 ?v8 ?v6)))

(:action op_1 
        :parameters (?v3 - type_2 ?v1 - type_3 ?v8 - type_4)
        :precondition (and (pred_6 ?v8 ?v3) 
                           (pred_6 ?v1 ?v3))
        :effect (and (not (pred_6 ?v1 ?v3))
                     (pred_4 ?v8 ?v1)))

(:action op_3 
        :parameters (?v3 - type_2 ?v1 - type_3 ?v8 - type_4 ?v5 - type_1)
        :precondition (and (pred_6 ?v8 ?v3) 
		      	   (pred_6 ?v5 ?v3)
			   (pred_4 ?v8 ?v1)
			   (pred_5 ?v1)
			   (pred_3 ?v5))
        :effect (and (not (pred_3 ?v5))(not (pred_5 ?v1)) (pred_1 ?v5)))
)