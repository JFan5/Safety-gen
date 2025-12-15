(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_1 type_5 - object
	type_2 type_4 type_3 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_1 ?v1 - type_5 ?v6 - type_1)
	(pred_5 ?v1 - type_2 ?v3 - type_3)
	(pred_3 ?v3 - type_3)
	(pred_2 ?v2 - type_1 ?v4 - type_1)
	(pred_6 ?v8 - type_4)
	(pred_4 ?v8 - type_4))                                                                                           
(:action op_3 
        :parameters (?v7 - type_1 ?v5 - type_1 ?v1 - type_2)
        :precondition (and (pred_1 ?v1 ?v7) 
                           (pred_2 ?v7 ?v5))                                                          
        :effect (and (not (pred_1 ?v1 ?v7)) (pred_1 ?v1 ?v5)))

(:action op_1 
        :parameters (?v6 - type_1 ?v3 - type_3 ?v1 - type_2)
        :precondition (and (pred_1 ?v1 ?v6) 
                           (pred_1 ?v3 ?v6))
        :effect (and (not (pred_1 ?v3 ?v6))
                     (pred_5 ?v1 ?v3)))

(:action op_2 
        :parameters (?v6 - type_1 ?v3 - type_3 ?v1 - type_2 ?v8 - type_4)
        :precondition (and (pred_1 ?v1 ?v6) 
		      	   (pred_1 ?v8 ?v6)
			   (pred_5 ?v1 ?v3)
			   (pred_3 ?v3)
			   (pred_4 ?v8))
        :effect (and (not (pred_4 ?v8))(not (pred_3 ?v3)) (pred_6 ?v8)))
)