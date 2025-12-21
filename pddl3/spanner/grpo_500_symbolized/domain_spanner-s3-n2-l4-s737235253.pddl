(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_4 type_2 - object
	type_5 type_3 type_1 - type_2	
)                                           
                                                                               
(:predicates 
	(pred_5 ?v1 - type_2 ?v8 - type_4)
	(pred_6 ?v1 - type_5 ?v5 - type_1)
	(pred_4 ?v5 - type_1)
	(pred_1 ?v2 - type_4 ?v4 - type_4)
	(pred_3 ?v3 - type_3)
	(pred_2 ?v3 - type_3))                                                                                           
(:action op_2 
        :parameters (?v6 - type_4 ?v7 - type_4 ?v1 - type_5)
        :precondition (and (pred_5 ?v1 ?v6) 
                           (pred_1 ?v6 ?v7))                                                          
        :effect (and (not (pred_5 ?v1 ?v6)) (pred_5 ?v1 ?v7)))

(:action op_1 
        :parameters (?v8 - type_4 ?v5 - type_1 ?v1 - type_5)
        :precondition (and (pred_5 ?v1 ?v8) 
                           (pred_5 ?v5 ?v8))
        :effect (and (not (pred_5 ?v5 ?v8))
                     (pred_6 ?v1 ?v5)))

(:action op_3 
        :parameters (?v8 - type_4 ?v5 - type_1 ?v1 - type_5 ?v3 - type_3)
        :precondition (and (pred_5 ?v1 ?v8) 
		      	   (pred_5 ?v3 ?v8)
			   (pred_6 ?v1 ?v5)
			   (pred_4 ?v5)
			   (pred_2 ?v3))
        :effect (and (not (pred_2 ?v3))(not (pred_4 ?v5)) (pred_3 ?v3)))
)