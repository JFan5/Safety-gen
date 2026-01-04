(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_2 type_5 - object
	type_3 type_1 type_4 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_3 ?v6 - type_5 ?v4 - type_2)
	(pred_1 ?v6 - type_3 ?v7 - type_4)
	(pred_6 ?v7 - type_4)
	(pred_2 ?v1 - type_2 ?v3 - type_2)
	(pred_4 ?v8 - type_1)
	(pred_5 ?v8 - type_1))                                                                                           
(:action op_1 
        :parameters (?v5 - type_2 ?v2 - type_2 ?v6 - type_3)
        :precondition (and (pred_3 ?v6 ?v5) 
                           (pred_2 ?v5 ?v2))                                                          
        :effect (and (not (pred_3 ?v6 ?v5)) (pred_3 ?v6 ?v2)))

(:action op_3 
        :parameters (?v4 - type_2 ?v7 - type_4 ?v6 - type_3)
        :precondition (and (pred_3 ?v6 ?v4) 
                           (pred_3 ?v7 ?v4))
        :effect (and (not (pred_3 ?v7 ?v4))
                     (pred_1 ?v6 ?v7)))

(:action op_2 
        :parameters (?v4 - type_2 ?v7 - type_4 ?v6 - type_3 ?v8 - type_1)
        :precondition (and (pred_3 ?v6 ?v4) 
		      	   (pred_3 ?v8 ?v4)
			   (pred_1 ?v6 ?v7)
			   (pred_6 ?v7)
			   (pred_5 ?v8))
        :effect (and (not (pred_5 ?v8))(not (pred_6 ?v7)) (pred_4 ?v8)))
)