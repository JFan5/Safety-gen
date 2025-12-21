(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_2 type_5 - object
	type_4 type_1 type_3 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_3 ?v3 - type_5 ?v8 - type_2)
	(pred_4 ?v3 - type_4 ?v2 - type_3)
	(pred_2 ?v2 - type_3)
	(pred_6 ?v1 - type_2 ?v7 - type_2)
	(pred_1 ?v4 - type_1)
	(pred_5 ?v4 - type_1))                                                                                           
(:action op_1 
        :parameters (?v5 - type_2 ?v6 - type_2 ?v3 - type_4)
        :precondition (and (pred_3 ?v3 ?v5) 
                           (pred_6 ?v5 ?v6))                                                          
        :effect (and (not (pred_3 ?v3 ?v5)) (pred_3 ?v3 ?v6)))

(:action op_2 
        :parameters (?v8 - type_2 ?v2 - type_3 ?v3 - type_4)
        :precondition (and (pred_3 ?v3 ?v8) 
                           (pred_3 ?v2 ?v8))
        :effect (and (not (pred_3 ?v2 ?v8))
                     (pred_4 ?v3 ?v2)))

(:action op_3 
        :parameters (?v8 - type_2 ?v2 - type_3 ?v3 - type_4 ?v4 - type_1)
        :precondition (and (pred_3 ?v3 ?v8) 
		      	   (pred_3 ?v4 ?v8)
			   (pred_4 ?v3 ?v2)
			   (pred_2 ?v2)
			   (pred_5 ?v4))
        :effect (and (not (pred_5 ?v4))(not (pred_2 ?v2)) (pred_1 ?v4)))
)