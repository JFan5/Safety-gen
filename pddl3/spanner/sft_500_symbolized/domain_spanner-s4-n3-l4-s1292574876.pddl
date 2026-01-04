(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_5 type_1 - object
	type_3 type_4 type_2 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_1 ?v5 - type_1 ?v8 - type_5)
	(pred_5 ?v5 - type_3 ?v1 - type_2)
	(pred_2 ?v1 - type_2)
	(pred_6 ?v2 - type_5 ?v7 - type_5)
	(pred_3 ?v6 - type_4)
	(pred_4 ?v6 - type_4))                                                                                           
(:action op_2 
        :parameters (?v3 - type_5 ?v4 - type_5 ?v5 - type_3)
        :precondition (and (pred_1 ?v5 ?v3) 
                           (pred_6 ?v3 ?v4))                                                          
        :effect (and (not (pred_1 ?v5 ?v3)) (pred_1 ?v5 ?v4)))

(:action op_3 
        :parameters (?v8 - type_5 ?v1 - type_2 ?v5 - type_3)
        :precondition (and (pred_1 ?v5 ?v8) 
                           (pred_1 ?v1 ?v8))
        :effect (and (not (pred_1 ?v1 ?v8))
                     (pred_5 ?v5 ?v1)))

(:action op_1 
        :parameters (?v8 - type_5 ?v1 - type_2 ?v5 - type_3 ?v6 - type_4)
        :precondition (and (pred_1 ?v5 ?v8) 
		      	   (pred_1 ?v6 ?v8)
			   (pred_5 ?v5 ?v1)
			   (pred_2 ?v1)
			   (pred_4 ?v6))
        :effect (and (not (pred_4 ?v6))(not (pred_2 ?v1)) (pred_3 ?v6)))
)