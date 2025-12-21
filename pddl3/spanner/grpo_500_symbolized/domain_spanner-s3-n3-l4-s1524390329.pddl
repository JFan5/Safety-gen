(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_4 type_2 - object
	type_1 type_5 type_3 - type_2	
)                                           
                                                                               
(:predicates 
	(pred_2 ?v2 - type_2 ?v4 - type_4)
	(pred_4 ?v2 - type_1 ?v5 - type_3)
	(pred_5 ?v5 - type_3)
	(pred_6 ?v3 - type_4 ?v8 - type_4)
	(pred_3 ?v6 - type_5)
	(pred_1 ?v6 - type_5))                                                                                           
(:action op_1 
        :parameters (?v7 - type_4 ?v1 - type_4 ?v2 - type_1)
        :precondition (and (pred_2 ?v2 ?v7) 
                           (pred_6 ?v7 ?v1))                                                          
        :effect (and (not (pred_2 ?v2 ?v7)) (pred_2 ?v2 ?v1)))

(:action op_2 
        :parameters (?v4 - type_4 ?v5 - type_3 ?v2 - type_1)
        :precondition (and (pred_2 ?v2 ?v4) 
                           (pred_2 ?v5 ?v4))
        :effect (and (not (pred_2 ?v5 ?v4))
                     (pred_4 ?v2 ?v5)))

(:action op_3 
        :parameters (?v4 - type_4 ?v5 - type_3 ?v2 - type_1 ?v6 - type_5)
        :precondition (and (pred_2 ?v2 ?v4) 
		      	   (pred_2 ?v6 ?v4)
			   (pred_4 ?v2 ?v5)
			   (pred_5 ?v5)
			   (pred_1 ?v6))
        :effect (and (not (pred_1 ?v6))(not (pred_5 ?v5)) (pred_3 ?v6)))
)