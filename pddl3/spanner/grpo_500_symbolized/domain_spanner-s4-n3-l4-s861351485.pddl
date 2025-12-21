(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_2 - object
	type_5 type_1 type_4 - type_2	
)                                           
                                                                               
(:predicates 
	(pred_4 ?v2 - type_2 ?v4 - type_3)
	(pred_1 ?v2 - type_5 ?v8 - type_4)
	(pred_6 ?v8 - type_4)
	(pred_5 ?v3 - type_3 ?v6 - type_3)
	(pred_3 ?v1 - type_1)
	(pred_2 ?v1 - type_1))                                                                                           
(:action op_2 
        :parameters (?v5 - type_3 ?v7 - type_3 ?v2 - type_5)
        :precondition (and (pred_4 ?v2 ?v5) 
                           (pred_5 ?v5 ?v7))                                                          
        :effect (and (not (pred_4 ?v2 ?v5)) (pred_4 ?v2 ?v7)))

(:action op_3 
        :parameters (?v4 - type_3 ?v8 - type_4 ?v2 - type_5)
        :precondition (and (pred_4 ?v2 ?v4) 
                           (pred_4 ?v8 ?v4))
        :effect (and (not (pred_4 ?v8 ?v4))
                     (pred_1 ?v2 ?v8)))

(:action op_1 
        :parameters (?v4 - type_3 ?v8 - type_4 ?v2 - type_5 ?v1 - type_1)
        :precondition (and (pred_4 ?v2 ?v4) 
		      	   (pred_4 ?v1 ?v4)
			   (pred_1 ?v2 ?v8)
			   (pred_6 ?v8)
			   (pred_2 ?v1))
        :effect (and (not (pred_2 ?v1))(not (pred_6 ?v8)) (pred_3 ?v1)))
)