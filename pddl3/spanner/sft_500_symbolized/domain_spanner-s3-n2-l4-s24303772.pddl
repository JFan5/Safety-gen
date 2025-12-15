(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_1 type_5 - object
	type_3 type_4 type_2 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_3 ?v1 - type_5 ?v3 - type_1)
	(pred_2 ?v1 - type_3 ?v2 - type_2)
	(pred_1 ?v2 - type_2)
	(pred_4 ?v7 - type_1 ?v4 - type_1)
	(pred_6 ?v5 - type_4)
	(pred_5 ?v5 - type_4))                                                                                           
(:action op_2 
        :parameters (?v6 - type_1 ?v8 - type_1 ?v1 - type_3)
        :precondition (and (pred_3 ?v1 ?v6) 
                           (pred_4 ?v6 ?v8))                                                          
        :effect (and (not (pred_3 ?v1 ?v6)) (pred_3 ?v1 ?v8)))

(:action op_3 
        :parameters (?v3 - type_1 ?v2 - type_2 ?v1 - type_3)
        :precondition (and (pred_3 ?v1 ?v3) 
                           (pred_3 ?v2 ?v3))
        :effect (and (not (pred_3 ?v2 ?v3))
                     (pred_2 ?v1 ?v2)))

(:action op_1 
        :parameters (?v3 - type_1 ?v2 - type_2 ?v1 - type_3 ?v5 - type_4)
        :precondition (and (pred_3 ?v1 ?v3) 
		      	   (pred_3 ?v5 ?v3)
			   (pred_2 ?v1 ?v2)
			   (pred_1 ?v2)
			   (pred_5 ?v5))
        :effect (and (not (pred_5 ?v5))(not (pred_1 ?v2)) (pred_6 ?v5)))
)