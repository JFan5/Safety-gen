(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_1 - object
	type_2 type_5 type_4 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_3 ?v1 - type_1 ?v7 - type_3)
	(pred_1 ?v1 - type_2 ?v2 - type_4)
	(pred_5 ?v2 - type_4)
	(pred_2 ?v8 - type_3 ?v3 - type_3)
	(pred_6 ?v6 - type_5)
	(pred_4 ?v6 - type_5))                                                                                           
(:action op_2 
        :parameters (?v5 - type_3 ?v4 - type_3 ?v1 - type_2)
        :precondition (and (pred_3 ?v1 ?v5) 
                           (pred_2 ?v5 ?v4))                                                          
        :effect (and (not (pred_3 ?v1 ?v5)) (pred_3 ?v1 ?v4)))

(:action op_1 
        :parameters (?v7 - type_3 ?v2 - type_4 ?v1 - type_2)
        :precondition (and (pred_3 ?v1 ?v7) 
                           (pred_3 ?v2 ?v7))
        :effect (and (not (pred_3 ?v2 ?v7))
                     (pred_1 ?v1 ?v2)))

(:action op_3 
        :parameters (?v7 - type_3 ?v2 - type_4 ?v1 - type_2 ?v6 - type_5)
        :precondition (and (pred_3 ?v1 ?v7) 
		      	   (pred_3 ?v6 ?v7)
			   (pred_1 ?v1 ?v2)
			   (pred_5 ?v2)
			   (pred_4 ?v6))
        :effect (and (not (pred_4 ?v6))(not (pred_5 ?v2)) (pred_6 ?v6)))
)