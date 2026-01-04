(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_2 - object
	type_1 type_4 type_5 - type_2	
)                                           
                                                                               
(:predicates 
	(pred_2 ?v4 - type_2 ?v3 - type_3)
	(pred_5 ?v4 - type_1 ?v5 - type_5)
	(pred_4 ?v5 - type_5)
	(pred_3 ?v6 - type_3 ?v2 - type_3)
	(pred_6 ?v8 - type_4)
	(pred_1 ?v8 - type_4))                                                                                           
(:action op_3 
        :parameters (?v7 - type_3 ?v1 - type_3 ?v4 - type_1)
        :precondition (and (pred_2 ?v4 ?v7) 
                           (pred_3 ?v7 ?v1))                                                          
        :effect (and (not (pred_2 ?v4 ?v7)) (pred_2 ?v4 ?v1)))

(:action op_1 
        :parameters (?v3 - type_3 ?v5 - type_5 ?v4 - type_1)
        :precondition (and (pred_2 ?v4 ?v3) 
                           (pred_2 ?v5 ?v3))
        :effect (and (not (pred_2 ?v5 ?v3))
                     (pred_5 ?v4 ?v5)))

(:action op_2 
        :parameters (?v3 - type_3 ?v5 - type_5 ?v4 - type_1 ?v8 - type_4)
        :precondition (and (pred_2 ?v4 ?v3) 
		      	   (pred_2 ?v8 ?v3)
			   (pred_5 ?v4 ?v5)
			   (pred_4 ?v5)
			   (pred_1 ?v8))
        :effect (and (not (pred_1 ?v8))(not (pred_4 ?v5)) (pred_6 ?v8)))
)