(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_2 type_5 - object
	type_1 type_4 type_3 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_4 ?v2 - type_5 ?v4 - type_2)
	(pred_5 ?v2 - type_1 ?v8 - type_3)
	(pred_6 ?v8 - type_3)
	(pred_1 ?v7 - type_2 ?v3 - type_2)
	(pred_3 ?v1 - type_4)
	(pred_2 ?v1 - type_4))                                                                                           
(:action op_3 
        :parameters (?v5 - type_2 ?v6 - type_2 ?v2 - type_1)
        :precondition (and (pred_4 ?v2 ?v5) 
                           (pred_1 ?v5 ?v6))                                                          
        :effect (and (not (pred_4 ?v2 ?v5)) (pred_4 ?v2 ?v6)))

(:action op_2 
        :parameters (?v4 - type_2 ?v8 - type_3 ?v2 - type_1)
        :precondition (and (pred_4 ?v2 ?v4) 
                           (pred_4 ?v8 ?v4))
        :effect (and (not (pred_4 ?v8 ?v4))
                     (pred_5 ?v2 ?v8)))

(:action op_1 
        :parameters (?v4 - type_2 ?v8 - type_3 ?v2 - type_1 ?v1 - type_4)
        :precondition (and (pred_4 ?v2 ?v4) 
		      	   (pred_4 ?v1 ?v4)
			   (pred_5 ?v2 ?v8)
			   (pred_6 ?v8)
			   (pred_2 ?v1))
        :effect (and (not (pred_2 ?v1))(not (pred_6 ?v8)) (pred_3 ?v1)))
)