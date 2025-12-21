(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_4 type_1 - object
	type_3 type_5 type_2 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_3 ?v4 - type_1 ?v8 - type_4)
	(pred_6 ?v4 - type_3 ?v2 - type_2)
	(pred_4 ?v2 - type_2)
	(pred_5 ?v1 - type_4 ?v3 - type_4)
	(pred_1 ?v6 - type_5)
	(pred_2 ?v6 - type_5))                                                                                           
(:action op_1 
        :parameters (?v5 - type_4 ?v7 - type_4 ?v4 - type_3)
        :precondition (and (pred_3 ?v4 ?v5) 
                           (pred_5 ?v5 ?v7))                                                          
        :effect (and (not (pred_3 ?v4 ?v5)) (pred_3 ?v4 ?v7)))

(:action op_2 
        :parameters (?v8 - type_4 ?v2 - type_2 ?v4 - type_3)
        :precondition (and (pred_3 ?v4 ?v8) 
                           (pred_3 ?v2 ?v8))
        :effect (and (not (pred_3 ?v2 ?v8))
                     (pred_6 ?v4 ?v2)))

(:action op_3 
        :parameters (?v8 - type_4 ?v2 - type_2 ?v4 - type_3 ?v6 - type_5)
        :precondition (and (pred_3 ?v4 ?v8) 
		      	   (pred_3 ?v6 ?v8)
			   (pred_6 ?v4 ?v2)
			   (pred_4 ?v2)
			   (pred_2 ?v6))
        :effect (and (not (pred_2 ?v6))(not (pred_4 ?v2)) (pred_1 ?v6)))
)