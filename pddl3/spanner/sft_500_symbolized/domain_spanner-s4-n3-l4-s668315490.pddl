(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_2 type_5 - object
	type_1 type_3 type_4 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_3 ?v4 - type_5 ?v2 - type_2)
	(pred_6 ?v4 - type_1 ?v6 - type_4)
	(pred_1 ?v6 - type_4)
	(pred_2 ?v7 - type_2 ?v5 - type_2)
	(pred_5 ?v8 - type_3)
	(pred_4 ?v8 - type_3))                                                                                           
(:action op_3 
        :parameters (?v3 - type_2 ?v1 - type_2 ?v4 - type_1)
        :precondition (and (pred_3 ?v4 ?v3) 
                           (pred_2 ?v3 ?v1))                                                          
        :effect (and (not (pred_3 ?v4 ?v3)) (pred_3 ?v4 ?v1)))

(:action op_1 
        :parameters (?v2 - type_2 ?v6 - type_4 ?v4 - type_1)
        :precondition (and (pred_3 ?v4 ?v2) 
                           (pred_3 ?v6 ?v2))
        :effect (and (not (pred_3 ?v6 ?v2))
                     (pred_6 ?v4 ?v6)))

(:action op_2 
        :parameters (?v2 - type_2 ?v6 - type_4 ?v4 - type_1 ?v8 - type_3)
        :precondition (and (pred_3 ?v4 ?v2) 
		      	   (pred_3 ?v8 ?v2)
			   (pred_6 ?v4 ?v6)
			   (pred_1 ?v6)
			   (pred_4 ?v8))
        :effect (and (not (pred_4 ?v8))(not (pred_1 ?v6)) (pred_5 ?v8)))
)