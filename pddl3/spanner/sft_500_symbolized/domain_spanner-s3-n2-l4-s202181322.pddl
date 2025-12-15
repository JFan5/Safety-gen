(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_2 - object
	type_1 type_4 type_5 - type_2	
)                                           
                                                                               
(:predicates 
	(pred_6 ?v3 - type_2 ?v6 - type_3)
	(pred_4 ?v3 - type_1 ?v8 - type_5)
	(pred_1 ?v8 - type_5)
	(pred_5 ?v2 - type_3 ?v4 - type_3)
	(pred_3 ?v7 - type_4)
	(pred_2 ?v7 - type_4))                                                                                           
(:action op_3 
        :parameters (?v1 - type_3 ?v5 - type_3 ?v3 - type_1)
        :precondition (and (pred_6 ?v3 ?v1) 
                           (pred_5 ?v1 ?v5))                                                          
        :effect (and (not (pred_6 ?v3 ?v1)) (pred_6 ?v3 ?v5)))

(:action op_1 
        :parameters (?v6 - type_3 ?v8 - type_5 ?v3 - type_1)
        :precondition (and (pred_6 ?v3 ?v6) 
                           (pred_6 ?v8 ?v6))
        :effect (and (not (pred_6 ?v8 ?v6))
                     (pred_4 ?v3 ?v8)))

(:action op_2 
        :parameters (?v6 - type_3 ?v8 - type_5 ?v3 - type_1 ?v7 - type_4)
        :precondition (and (pred_6 ?v3 ?v6) 
		      	   (pred_6 ?v7 ?v6)
			   (pred_4 ?v3 ?v8)
			   (pred_1 ?v8)
			   (pred_2 ?v7))
        :effect (and (not (pred_2 ?v7))(not (pred_1 ?v8)) (pred_3 ?v7)))
)