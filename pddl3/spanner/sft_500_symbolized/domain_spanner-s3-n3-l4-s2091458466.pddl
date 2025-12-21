(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_5 type_1 - object
	type_4 type_3 type_2 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_4 ?v5 - type_1 ?v3 - type_5)
	(pred_1 ?v5 - type_4 ?v2 - type_2)
	(pred_3 ?v2 - type_2)
	(pred_6 ?v1 - type_5 ?v8 - type_5)
	(pred_5 ?v6 - type_3)
	(pred_2 ?v6 - type_3))                                                                                           
(:action op_2 
        :parameters (?v7 - type_5 ?v4 - type_5 ?v5 - type_4)
        :precondition (and (pred_4 ?v5 ?v7) 
                           (pred_6 ?v7 ?v4))                                                          
        :effect (and (not (pred_4 ?v5 ?v7)) (pred_4 ?v5 ?v4)))

(:action op_1 
        :parameters (?v3 - type_5 ?v2 - type_2 ?v5 - type_4)
        :precondition (and (pred_4 ?v5 ?v3) 
                           (pred_4 ?v2 ?v3))
        :effect (and (not (pred_4 ?v2 ?v3))
                     (pred_1 ?v5 ?v2)))

(:action op_3 
        :parameters (?v3 - type_5 ?v2 - type_2 ?v5 - type_4 ?v6 - type_3)
        :precondition (and (pred_4 ?v5 ?v3) 
		      	   (pred_4 ?v6 ?v3)
			   (pred_1 ?v5 ?v2)
			   (pred_3 ?v2)
			   (pred_2 ?v6))
        :effect (and (not (pred_2 ?v6))(not (pred_3 ?v2)) (pred_5 ?v6)))
)