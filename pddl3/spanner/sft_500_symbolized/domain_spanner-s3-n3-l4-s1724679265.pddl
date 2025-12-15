(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_2 type_5 - object
	type_1 type_4 type_3 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_6 ?v2 - type_5 ?v6 - type_2)
	(pred_4 ?v2 - type_1 ?v5 - type_3)
	(pred_2 ?v5 - type_3)
	(pred_3 ?v3 - type_2 ?v4 - type_2)
	(pred_1 ?v1 - type_4)
	(pred_5 ?v1 - type_4))                                                                                           
(:action op_1 
        :parameters (?v8 - type_2 ?v7 - type_2 ?v2 - type_1)
        :precondition (and (pred_6 ?v2 ?v8) 
                           (pred_3 ?v8 ?v7))                                                          
        :effect (and (not (pred_6 ?v2 ?v8)) (pred_6 ?v2 ?v7)))

(:action op_2 
        :parameters (?v6 - type_2 ?v5 - type_3 ?v2 - type_1)
        :precondition (and (pred_6 ?v2 ?v6) 
                           (pred_6 ?v5 ?v6))
        :effect (and (not (pred_6 ?v5 ?v6))
                     (pred_4 ?v2 ?v5)))

(:action op_3 
        :parameters (?v6 - type_2 ?v5 - type_3 ?v2 - type_1 ?v1 - type_4)
        :precondition (and (pred_6 ?v2 ?v6) 
		      	   (pred_6 ?v1 ?v6)
			   (pred_4 ?v2 ?v5)
			   (pred_2 ?v5)
			   (pred_5 ?v1))
        :effect (and (not (pred_5 ?v1))(not (pred_2 ?v5)) (pred_1 ?v1)))
)