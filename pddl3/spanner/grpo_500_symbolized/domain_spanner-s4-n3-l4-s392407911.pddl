(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_4 type_1 - object
	type_5 type_2 type_3 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_2 ?v8 - type_1 ?v4 - type_4)
	(pred_6 ?v8 - type_5 ?v1 - type_3)
	(pred_5 ?v1 - type_3)
	(pred_3 ?v2 - type_4 ?v3 - type_4)
	(pred_4 ?v6 - type_2)
	(pred_1 ?v6 - type_2))                                                                                           
(:action op_1 
        :parameters (?v5 - type_4 ?v7 - type_4 ?v8 - type_5)
        :precondition (and (pred_2 ?v8 ?v5) 
                           (pred_3 ?v5 ?v7))                                                          
        :effect (and (not (pred_2 ?v8 ?v5)) (pred_2 ?v8 ?v7)))

(:action op_3 
        :parameters (?v4 - type_4 ?v1 - type_3 ?v8 - type_5)
        :precondition (and (pred_2 ?v8 ?v4) 
                           (pred_2 ?v1 ?v4))
        :effect (and (not (pred_2 ?v1 ?v4))
                     (pred_6 ?v8 ?v1)))

(:action op_2 
        :parameters (?v4 - type_4 ?v1 - type_3 ?v8 - type_5 ?v6 - type_2)
        :precondition (and (pred_2 ?v8 ?v4) 
		      	   (pred_2 ?v6 ?v4)
			   (pred_6 ?v8 ?v1)
			   (pred_5 ?v1)
			   (pred_1 ?v6))
        :effect (and (not (pred_1 ?v6))(not (pred_5 ?v1)) (pred_4 ?v6)))
)