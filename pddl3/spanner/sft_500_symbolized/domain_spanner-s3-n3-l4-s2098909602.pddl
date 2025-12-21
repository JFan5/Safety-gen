(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_5 type_3 - object
	type_1 type_4 type_2 - type_3	
)                                           
                                                                               
(:predicates 
	(pred_4 ?v1 - type_3 ?v8 - type_5)
	(pred_5 ?v1 - type_1 ?v2 - type_2)
	(pred_3 ?v2 - type_2)
	(pred_1 ?v5 - type_5 ?v4 - type_5)
	(pred_2 ?v6 - type_4)
	(pred_6 ?v6 - type_4))                                                                                           
(:action op_2 
        :parameters (?v3 - type_5 ?v7 - type_5 ?v1 - type_1)
        :precondition (and (pred_4 ?v1 ?v3) 
                           (pred_1 ?v3 ?v7))                                                          
        :effect (and (not (pred_4 ?v1 ?v3)) (pred_4 ?v1 ?v7)))

(:action op_3 
        :parameters (?v8 - type_5 ?v2 - type_2 ?v1 - type_1)
        :precondition (and (pred_4 ?v1 ?v8) 
                           (pred_4 ?v2 ?v8))
        :effect (and (not (pred_4 ?v2 ?v8))
                     (pred_5 ?v1 ?v2)))

(:action op_1 
        :parameters (?v8 - type_5 ?v2 - type_2 ?v1 - type_1 ?v6 - type_4)
        :precondition (and (pred_4 ?v1 ?v8) 
		      	   (pred_4 ?v6 ?v8)
			   (pred_5 ?v1 ?v2)
			   (pred_3 ?v2)
			   (pred_6 ?v6))
        :effect (and (not (pred_6 ?v6))(not (pred_3 ?v2)) (pred_2 ?v6)))
)