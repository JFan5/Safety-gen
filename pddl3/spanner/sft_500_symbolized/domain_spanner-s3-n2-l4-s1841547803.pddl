(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_5 - object
	type_4 type_2 type_1 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_3 ?v5 - type_5 ?v4 - type_3)
	(pred_5 ?v5 - type_4 ?v2 - type_1)
	(pred_6 ?v2 - type_1)
	(pred_1 ?v7 - type_3 ?v3 - type_3)
	(pred_4 ?v6 - type_2)
	(pred_2 ?v6 - type_2))                                                                                           
(:action op_1 
        :parameters (?v8 - type_3 ?v1 - type_3 ?v5 - type_4)
        :precondition (and (pred_3 ?v5 ?v8) 
                           (pred_1 ?v8 ?v1))                                                          
        :effect (and (not (pred_3 ?v5 ?v8)) (pred_3 ?v5 ?v1)))

(:action op_2 
        :parameters (?v4 - type_3 ?v2 - type_1 ?v5 - type_4)
        :precondition (and (pred_3 ?v5 ?v4) 
                           (pred_3 ?v2 ?v4))
        :effect (and (not (pred_3 ?v2 ?v4))
                     (pred_5 ?v5 ?v2)))

(:action op_3 
        :parameters (?v4 - type_3 ?v2 - type_1 ?v5 - type_4 ?v6 - type_2)
        :precondition (and (pred_3 ?v5 ?v4) 
		      	   (pred_3 ?v6 ?v4)
			   (pred_5 ?v5 ?v2)
			   (pred_6 ?v2)
			   (pred_2 ?v6))
        :effect (and (not (pred_2 ?v6))(not (pred_6 ?v2)) (pred_4 ?v6)))
)