(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_2 - object
	type_4 type_1 type_5 - type_2	
)                                           
                                                                               
(:predicates 
	(pred_4 ?v1 - type_2 ?v5 - type_3)
	(pred_6 ?v1 - type_4 ?v2 - type_5)
	(pred_2 ?v2 - type_5)
	(pred_5 ?v6 - type_3 ?v7 - type_3)
	(pred_3 ?v8 - type_1)
	(pred_1 ?v8 - type_1))                                                                                           
(:action op_1 
        :parameters (?v3 - type_3 ?v4 - type_3 ?v1 - type_4)
        :precondition (and (pred_4 ?v1 ?v3) 
                           (pred_5 ?v3 ?v4))                                                          
        :effect (and (not (pred_4 ?v1 ?v3)) (pred_4 ?v1 ?v4)))

(:action op_3 
        :parameters (?v5 - type_3 ?v2 - type_5 ?v1 - type_4)
        :precondition (and (pred_4 ?v1 ?v5) 
                           (pred_4 ?v2 ?v5))
        :effect (and (not (pred_4 ?v2 ?v5))
                     (pred_6 ?v1 ?v2)))

(:action op_2 
        :parameters (?v5 - type_3 ?v2 - type_5 ?v1 - type_4 ?v8 - type_1)
        :precondition (and (pred_4 ?v1 ?v5) 
		      	   (pred_4 ?v8 ?v5)
			   (pred_6 ?v1 ?v2)
			   (pred_2 ?v2)
			   (pred_1 ?v8))
        :effect (and (not (pred_1 ?v8))(not (pred_2 ?v2)) (pred_3 ?v8)))
)