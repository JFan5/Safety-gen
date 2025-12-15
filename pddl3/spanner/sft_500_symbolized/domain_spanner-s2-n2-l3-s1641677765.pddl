(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_4 type_5 - object
	type_2 type_3 type_1 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_3 ?v1 - type_5 ?v6 - type_4)
	(pred_6 ?v1 - type_2 ?v5 - type_1)
	(pred_1 ?v5 - type_1)
	(pred_5 ?v4 - type_4 ?v8 - type_4)
	(pred_4 ?v3 - type_3)
	(pred_2 ?v3 - type_3))                                                                                           
(:action op_3 
        :parameters (?v2 - type_4 ?v7 - type_4 ?v1 - type_2)
        :precondition (and (pred_3 ?v1 ?v2) 
                           (pred_5 ?v2 ?v7))                                                          
        :effect (and (not (pred_3 ?v1 ?v2)) (pred_3 ?v1 ?v7)))

(:action op_2 
        :parameters (?v6 - type_4 ?v5 - type_1 ?v1 - type_2)
        :precondition (and (pred_3 ?v1 ?v6) 
                           (pred_3 ?v5 ?v6))
        :effect (and (not (pred_3 ?v5 ?v6))
                     (pred_6 ?v1 ?v5)))

(:action op_1 
        :parameters (?v6 - type_4 ?v5 - type_1 ?v1 - type_2 ?v3 - type_3)
        :precondition (and (pred_3 ?v1 ?v6) 
		      	   (pred_3 ?v3 ?v6)
			   (pred_6 ?v1 ?v5)
			   (pred_1 ?v5)
			   (pred_2 ?v3))
        :effect (and (not (pred_2 ?v3))(not (pred_1 ?v5)) (pred_4 ?v3)))
)