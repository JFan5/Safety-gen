(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_4 type_2 - object
	type_5 type_3 type_1 - type_2	
)                                           
                                                                               
(:predicates 
	(pred_3 ?v4 - type_2 ?v6 - type_4)
	(pred_1 ?v4 - type_5 ?v8 - type_1)
	(pred_4 ?v8 - type_1)
	(pred_6 ?v3 - type_4 ?v2 - type_4)
	(pred_2 ?v5 - type_3)
	(pred_5 ?v5 - type_3))                                                                                           
(:action op_3 
        :parameters (?v7 - type_4 ?v1 - type_4 ?v4 - type_5)
        :precondition (and (pred_3 ?v4 ?v7) 
                           (pred_6 ?v7 ?v1))                                                          
        :effect (and (not (pred_3 ?v4 ?v7)) (pred_3 ?v4 ?v1)))

(:action op_1 
        :parameters (?v6 - type_4 ?v8 - type_1 ?v4 - type_5)
        :precondition (and (pred_3 ?v4 ?v6) 
                           (pred_3 ?v8 ?v6))
        :effect (and (not (pred_3 ?v8 ?v6))
                     (pred_1 ?v4 ?v8)))

(:action op_2 
        :parameters (?v6 - type_4 ?v8 - type_1 ?v4 - type_5 ?v5 - type_3)
        :precondition (and (pred_3 ?v4 ?v6) 
		      	   (pred_3 ?v5 ?v6)
			   (pred_1 ?v4 ?v8)
			   (pred_4 ?v8)
			   (pred_5 ?v5))
        :effect (and (not (pred_5 ?v5))(not (pred_4 ?v8)) (pred_2 ?v5)))
)