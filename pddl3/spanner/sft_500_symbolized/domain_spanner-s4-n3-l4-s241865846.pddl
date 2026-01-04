(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_4 type_1 - object
	type_5 type_3 type_2 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_4 ?v6 - type_1 ?v4 - type_4)
	(pred_5 ?v6 - type_5 ?v1 - type_2)
	(pred_3 ?v1 - type_2)
	(pred_1 ?v3 - type_4 ?v2 - type_4)
	(pred_2 ?v8 - type_3)
	(pred_6 ?v8 - type_3))                                                                                           
(:action op_1 
        :parameters (?v7 - type_4 ?v5 - type_4 ?v6 - type_5)
        :precondition (and (pred_4 ?v6 ?v7) 
                           (pred_1 ?v7 ?v5))                                                          
        :effect (and (not (pred_4 ?v6 ?v7)) (pred_4 ?v6 ?v5)))

(:action op_3 
        :parameters (?v4 - type_4 ?v1 - type_2 ?v6 - type_5)
        :precondition (and (pred_4 ?v6 ?v4) 
                           (pred_4 ?v1 ?v4))
        :effect (and (not (pred_4 ?v1 ?v4))
                     (pred_5 ?v6 ?v1)))

(:action op_2 
        :parameters (?v4 - type_4 ?v1 - type_2 ?v6 - type_5 ?v8 - type_3)
        :precondition (and (pred_4 ?v6 ?v4) 
		      	   (pred_4 ?v8 ?v4)
			   (pred_5 ?v6 ?v1)
			   (pred_3 ?v1)
			   (pred_6 ?v8))
        :effect (and (not (pred_6 ?v8))(not (pred_3 ?v1)) (pred_2 ?v8)))
)