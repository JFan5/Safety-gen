(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_1 type_3 - object
	type_2 type_5 type_4 - type_3	
)                                           
                                                                               
(:predicates 
	(pred_2 ?v2 - type_3 ?v7 - type_1)
	(pred_6 ?v2 - type_2 ?v6 - type_4)
	(pred_5 ?v6 - type_4)
	(pred_1 ?v3 - type_1 ?v4 - type_1)
	(pred_4 ?v8 - type_5)
	(pred_3 ?v8 - type_5))                                                                                           
(:action op_2 
        :parameters (?v1 - type_1 ?v5 - type_1 ?v2 - type_2)
        :precondition (and (pred_2 ?v2 ?v1) 
                           (pred_1 ?v1 ?v5))                                                          
        :effect (and (not (pred_2 ?v2 ?v1)) (pred_2 ?v2 ?v5)))

(:action op_1 
        :parameters (?v7 - type_1 ?v6 - type_4 ?v2 - type_2)
        :precondition (and (pred_2 ?v2 ?v7) 
                           (pred_2 ?v6 ?v7))
        :effect (and (not (pred_2 ?v6 ?v7))
                     (pred_6 ?v2 ?v6)))

(:action op_3 
        :parameters (?v7 - type_1 ?v6 - type_4 ?v2 - type_2 ?v8 - type_5)
        :precondition (and (pred_2 ?v2 ?v7) 
		      	   (pred_2 ?v8 ?v7)
			   (pred_6 ?v2 ?v6)
			   (pred_5 ?v6)
			   (pred_3 ?v8))
        :effect (and (not (pred_3 ?v8))(not (pred_5 ?v6)) (pred_4 ?v8)))
)