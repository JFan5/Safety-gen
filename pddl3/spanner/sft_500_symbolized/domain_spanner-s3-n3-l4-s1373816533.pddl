(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_1 type_2 - object
	type_3 type_4 type_5 - type_2	
)                                           
                                                                               
(:predicates 
	(pred_2 ?v3 - type_2 ?v6 - type_1)
	(pred_1 ?v3 - type_3 ?v1 - type_5)
	(pred_4 ?v1 - type_5)
	(pred_6 ?v2 - type_1 ?v4 - type_1)
	(pred_5 ?v5 - type_4)
	(pred_3 ?v5 - type_4))                                                                                           
(:action op_3 
        :parameters (?v7 - type_1 ?v8 - type_1 ?v3 - type_3)
        :precondition (and (pred_2 ?v3 ?v7) 
                           (pred_6 ?v7 ?v8))                                                          
        :effect (and (not (pred_2 ?v3 ?v7)) (pred_2 ?v3 ?v8)))

(:action op_2 
        :parameters (?v6 - type_1 ?v1 - type_5 ?v3 - type_3)
        :precondition (and (pred_2 ?v3 ?v6) 
                           (pred_2 ?v1 ?v6))
        :effect (and (not (pred_2 ?v1 ?v6))
                     (pred_1 ?v3 ?v1)))

(:action op_1 
        :parameters (?v6 - type_1 ?v1 - type_5 ?v3 - type_3 ?v5 - type_4)
        :precondition (and (pred_2 ?v3 ?v6) 
		      	   (pred_2 ?v5 ?v6)
			   (pred_1 ?v3 ?v1)
			   (pred_4 ?v1)
			   (pred_3 ?v5))
        :effect (and (not (pred_3 ?v5))(not (pred_4 ?v1)) (pred_5 ?v5)))
)