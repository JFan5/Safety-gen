(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_2 type_3 - object
	type_1 type_5 type_4 - type_3	
)                                           
                                                                               
(:predicates 
	(pred_4 ?v4 - type_3 ?v8 - type_2)
	(pred_2 ?v4 - type_1 ?v6 - type_4)
	(pred_3 ?v6 - type_4)
	(pred_6 ?v2 - type_2 ?v3 - type_2)
	(pred_1 ?v1 - type_5)
	(pred_5 ?v1 - type_5))                                                                                           
(:action op_3 
        :parameters (?v7 - type_2 ?v5 - type_2 ?v4 - type_1)
        :precondition (and (pred_4 ?v4 ?v7) 
                           (pred_6 ?v7 ?v5))                                                          
        :effect (and (not (pred_4 ?v4 ?v7)) (pred_4 ?v4 ?v5)))

(:action op_1 
        :parameters (?v8 - type_2 ?v6 - type_4 ?v4 - type_1)
        :precondition (and (pred_4 ?v4 ?v8) 
                           (pred_4 ?v6 ?v8))
        :effect (and (not (pred_4 ?v6 ?v8))
                     (pred_2 ?v4 ?v6)))

(:action op_2 
        :parameters (?v8 - type_2 ?v6 - type_4 ?v4 - type_1 ?v1 - type_5)
        :precondition (and (pred_4 ?v4 ?v8) 
		      	   (pred_4 ?v1 ?v8)
			   (pred_2 ?v4 ?v6)
			   (pred_3 ?v6)
			   (pred_5 ?v1))
        :effect (and (not (pred_5 ?v1))(not (pred_3 ?v6)) (pred_1 ?v1)))
)