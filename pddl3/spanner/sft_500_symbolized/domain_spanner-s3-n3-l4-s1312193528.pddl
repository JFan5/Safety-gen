(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_2 - object
	type_5 type_4 type_1 - type_2	
)                                           
                                                                               
(:predicates 
	(pred_1 ?v3 - type_2 ?v4 - type_3)
	(pred_3 ?v3 - type_5 ?v2 - type_1)
	(pred_2 ?v2 - type_1)
	(pred_6 ?v7 - type_3 ?v5 - type_3)
	(pred_5 ?v8 - type_4)
	(pred_4 ?v8 - type_4))                                                                                           
(:action op_2 
        :parameters (?v1 - type_3 ?v6 - type_3 ?v3 - type_5)
        :precondition (and (pred_1 ?v3 ?v1) 
                           (pred_6 ?v1 ?v6))                                                          
        :effect (and (not (pred_1 ?v3 ?v1)) (pred_1 ?v3 ?v6)))

(:action op_1 
        :parameters (?v4 - type_3 ?v2 - type_1 ?v3 - type_5)
        :precondition (and (pred_1 ?v3 ?v4) 
                           (pred_1 ?v2 ?v4))
        :effect (and (not (pred_1 ?v2 ?v4))
                     (pred_3 ?v3 ?v2)))

(:action op_3 
        :parameters (?v4 - type_3 ?v2 - type_1 ?v3 - type_5 ?v8 - type_4)
        :precondition (and (pred_1 ?v3 ?v4) 
		      	   (pred_1 ?v8 ?v4)
			   (pred_3 ?v3 ?v2)
			   (pred_2 ?v2)
			   (pred_4 ?v8))
        :effect (and (not (pred_4 ?v8))(not (pred_2 ?v2)) (pred_5 ?v8)))
)