(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_4 type_2 - object
	type_3 type_1 type_5 - type_2	
)                                           
                                                                               
(:predicates 
	(pred_1 ?v1 - type_2 ?v5 - type_4)
	(pred_4 ?v1 - type_3 ?v2 - type_5)
	(pred_6 ?v2 - type_5)
	(pred_3 ?v4 - type_4 ?v7 - type_4)
	(pred_2 ?v8 - type_1)
	(pred_5 ?v8 - type_1))                                                                                           
(:action op_2 
        :parameters (?v6 - type_4 ?v3 - type_4 ?v1 - type_3)
        :precondition (and (pred_1 ?v1 ?v6) 
                           (pred_3 ?v6 ?v3))                                                          
        :effect (and (not (pred_1 ?v1 ?v6)) (pred_1 ?v1 ?v3)))

(:action op_1 
        :parameters (?v5 - type_4 ?v2 - type_5 ?v1 - type_3)
        :precondition (and (pred_1 ?v1 ?v5) 
                           (pred_1 ?v2 ?v5))
        :effect (and (not (pred_1 ?v2 ?v5))
                     (pred_4 ?v1 ?v2)))

(:action op_3 
        :parameters (?v5 - type_4 ?v2 - type_5 ?v1 - type_3 ?v8 - type_1)
        :precondition (and (pred_1 ?v1 ?v5) 
		      	   (pred_1 ?v8 ?v5)
			   (pred_4 ?v1 ?v2)
			   (pred_6 ?v2)
			   (pred_5 ?v8))
        :effect (and (not (pred_5 ?v8))(not (pred_6 ?v2)) (pred_2 ?v8)))
)