(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_4 type_2 - object
	type_5 type_1 type_3 - type_2	
)                                           
                                                                               
(:predicates 
	(pred_4 ?v7 - type_2 ?v6 - type_4)
	(pred_5 ?v7 - type_5 ?v2 - type_3)
	(pred_6 ?v2 - type_3)
	(pred_1 ?v3 - type_4 ?v1 - type_4)
	(pred_3 ?v4 - type_1)
	(pred_2 ?v4 - type_1))                                                                                           
(:action op_3 
        :parameters (?v5 - type_4 ?v8 - type_4 ?v7 - type_5)
        :precondition (and (pred_4 ?v7 ?v5) 
                           (pred_1 ?v5 ?v8))                                                          
        :effect (and (not (pred_4 ?v7 ?v5)) (pred_4 ?v7 ?v8)))

(:action op_2 
        :parameters (?v6 - type_4 ?v2 - type_3 ?v7 - type_5)
        :precondition (and (pred_4 ?v7 ?v6) 
                           (pred_4 ?v2 ?v6))
        :effect (and (not (pred_4 ?v2 ?v6))
                     (pred_5 ?v7 ?v2)))

(:action op_1 
        :parameters (?v6 - type_4 ?v2 - type_3 ?v7 - type_5 ?v4 - type_1)
        :precondition (and (pred_4 ?v7 ?v6) 
		      	   (pred_4 ?v4 ?v6)
			   (pred_5 ?v7 ?v2)
			   (pred_6 ?v2)
			   (pred_2 ?v4))
        :effect (and (not (pred_2 ?v4))(not (pred_6 ?v2)) (pred_3 ?v4)))
)