(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_2 type_1 - object
	type_5 type_4 type_3 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_1 ?v2 - type_1 ?v1 - type_2)
	(pred_3 ?v2 - type_5 ?v6 - type_3)
	(pred_4 ?v6 - type_3)
	(pred_5 ?v3 - type_2 ?v4 - type_2)
	(pred_6 ?v8 - type_4)
	(pred_2 ?v8 - type_4))                                                                                           
(:action op_1 
        :parameters (?v7 - type_2 ?v5 - type_2 ?v2 - type_5)
        :precondition (and (pred_1 ?v2 ?v7) 
                           (pred_5 ?v7 ?v5))                                                          
        :effect (and (not (pred_1 ?v2 ?v7)) (pred_1 ?v2 ?v5)))

(:action op_3 
        :parameters (?v1 - type_2 ?v6 - type_3 ?v2 - type_5)
        :precondition (and (pred_1 ?v2 ?v1) 
                           (pred_1 ?v6 ?v1))
        :effect (and (not (pred_1 ?v6 ?v1))
                     (pred_3 ?v2 ?v6)))

(:action op_2 
        :parameters (?v1 - type_2 ?v6 - type_3 ?v2 - type_5 ?v8 - type_4)
        :precondition (and (pred_1 ?v2 ?v1) 
		      	   (pred_1 ?v8 ?v1)
			   (pred_3 ?v2 ?v6)
			   (pred_4 ?v6)
			   (pred_2 ?v8))
        :effect (and (not (pred_2 ?v8))(not (pred_4 ?v6)) (pred_6 ?v8)))
)