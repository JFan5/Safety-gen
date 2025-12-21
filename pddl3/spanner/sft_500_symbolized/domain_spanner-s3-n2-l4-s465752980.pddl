(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_1 type_2 - object
	type_4 type_3 type_5 - type_2	
)                                           
                                                                               
(:predicates 
	(pred_3 ?v5 - type_2 ?v3 - type_1)
	(pred_1 ?v5 - type_4 ?v8 - type_5)
	(pred_4 ?v8 - type_5)
	(pred_6 ?v1 - type_1 ?v2 - type_1)
	(pred_2 ?v6 - type_3)
	(pred_5 ?v6 - type_3))                                                                                           
(:action op_2 
        :parameters (?v4 - type_1 ?v7 - type_1 ?v5 - type_4)
        :precondition (and (pred_3 ?v5 ?v4) 
                           (pred_6 ?v4 ?v7))                                                          
        :effect (and (not (pred_3 ?v5 ?v4)) (pred_3 ?v5 ?v7)))

(:action op_1 
        :parameters (?v3 - type_1 ?v8 - type_5 ?v5 - type_4)
        :precondition (and (pred_3 ?v5 ?v3) 
                           (pred_3 ?v8 ?v3))
        :effect (and (not (pred_3 ?v8 ?v3))
                     (pred_1 ?v5 ?v8)))

(:action op_3 
        :parameters (?v3 - type_1 ?v8 - type_5 ?v5 - type_4 ?v6 - type_3)
        :precondition (and (pred_3 ?v5 ?v3) 
		      	   (pred_3 ?v6 ?v3)
			   (pred_1 ?v5 ?v8)
			   (pred_4 ?v8)
			   (pred_5 ?v6))
        :effect (and (not (pred_5 ?v6))(not (pred_4 ?v8)) (pred_2 ?v6)))
)