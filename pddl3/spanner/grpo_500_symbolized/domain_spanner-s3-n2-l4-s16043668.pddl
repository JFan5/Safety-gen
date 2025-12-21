(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_2 - object
	type_4 type_5 type_1 - type_2	
)                                           
                                                                               
(:predicates 
	(pred_2 ?v1 - type_2 ?v3 - type_3)
	(pred_1 ?v1 - type_4 ?v5 - type_1)
	(pred_3 ?v5 - type_1)
	(pred_5 ?v4 - type_3 ?v8 - type_3)
	(pred_6 ?v6 - type_5)
	(pred_4 ?v6 - type_5))                                                                                           
(:action op_2 
        :parameters (?v2 - type_3 ?v7 - type_3 ?v1 - type_4)
        :precondition (and (pred_2 ?v1 ?v2) 
                           (pred_5 ?v2 ?v7))                                                          
        :effect (and (not (pred_2 ?v1 ?v2)) (pred_2 ?v1 ?v7)))

(:action op_3 
        :parameters (?v3 - type_3 ?v5 - type_1 ?v1 - type_4)
        :precondition (and (pred_2 ?v1 ?v3) 
                           (pred_2 ?v5 ?v3))
        :effect (and (not (pred_2 ?v5 ?v3))
                     (pred_1 ?v1 ?v5)))

(:action op_1 
        :parameters (?v3 - type_3 ?v5 - type_1 ?v1 - type_4 ?v6 - type_5)
        :precondition (and (pred_2 ?v1 ?v3) 
		      	   (pred_2 ?v6 ?v3)
			   (pred_1 ?v1 ?v5)
			   (pred_3 ?v5)
			   (pred_4 ?v6))
        :effect (and (not (pred_4 ?v6))(not (pred_3 ?v5)) (pred_6 ?v6)))
)