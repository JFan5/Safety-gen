(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_4 type_5 - object
	type_3 type_1 type_2 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_1 ?v1 - type_5 ?v3 - type_4)
	(pred_4 ?v1 - type_3 ?v5 - type_2)
	(pred_2 ?v5 - type_2)
	(pred_5 ?v8 - type_4 ?v7 - type_4)
	(pred_6 ?v6 - type_1)
	(pred_3 ?v6 - type_1))                                                                                           
(:action op_3 
        :parameters (?v4 - type_4 ?v2 - type_4 ?v1 - type_3)
        :precondition (and (pred_1 ?v1 ?v4) 
                           (pred_5 ?v4 ?v2))                                                          
        :effect (and (not (pred_1 ?v1 ?v4)) (pred_1 ?v1 ?v2)))

(:action op_1 
        :parameters (?v3 - type_4 ?v5 - type_2 ?v1 - type_3)
        :precondition (and (pred_1 ?v1 ?v3) 
                           (pred_1 ?v5 ?v3))
        :effect (and (not (pred_1 ?v5 ?v3))
                     (pred_4 ?v1 ?v5)))

(:action op_2 
        :parameters (?v3 - type_4 ?v5 - type_2 ?v1 - type_3 ?v6 - type_1)
        :precondition (and (pred_1 ?v1 ?v3) 
		      	   (pred_1 ?v6 ?v3)
			   (pred_4 ?v1 ?v5)
			   (pred_2 ?v5)
			   (pred_3 ?v6))
        :effect (and (not (pred_3 ?v6))(not (pred_2 ?v5)) (pred_6 ?v6)))
)