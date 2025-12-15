(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_2 - object
	type_4 type_5 type_1 - type_2	
)                                           
                                                                               
(:predicates 
	(pred_4 ?v7 - type_2 ?v3 - type_3)
	(pred_3 ?v7 - type_4 ?v5 - type_1)
	(pred_2 ?v5 - type_1)
	(pred_5 ?v1 - type_3 ?v2 - type_3)
	(pred_6 ?v6 - type_5)
	(pred_1 ?v6 - type_5))                                                                                           
(:action op_3 
        :parameters (?v8 - type_3 ?v4 - type_3 ?v7 - type_4)
        :precondition (and (pred_4 ?v7 ?v8) 
                           (pred_5 ?v8 ?v4))                                                          
        :effect (and (not (pred_4 ?v7 ?v8)) (pred_4 ?v7 ?v4)))

(:action op_2 
        :parameters (?v3 - type_3 ?v5 - type_1 ?v7 - type_4)
        :precondition (and (pred_4 ?v7 ?v3) 
                           (pred_4 ?v5 ?v3))
        :effect (and (not (pred_4 ?v5 ?v3))
                     (pred_3 ?v7 ?v5)))

(:action op_1 
        :parameters (?v3 - type_3 ?v5 - type_1 ?v7 - type_4 ?v6 - type_5)
        :precondition (and (pred_4 ?v7 ?v3) 
		      	   (pred_4 ?v6 ?v3)
			   (pred_3 ?v7 ?v5)
			   (pred_2 ?v5)
			   (pred_1 ?v6))
        :effect (and (not (pred_1 ?v6))(not (pred_2 ?v5)) (pred_6 ?v6)))
)