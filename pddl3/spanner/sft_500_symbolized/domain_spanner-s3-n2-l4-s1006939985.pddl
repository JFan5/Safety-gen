(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_2 type_3 - object
	type_5 type_1 type_4 - type_3	
)                                           
                                                                               
(:predicates 
	(pred_1 ?v7 - type_3 ?v4 - type_2)
	(pred_5 ?v7 - type_5 ?v6 - type_4)
	(pred_3 ?v6 - type_4)
	(pred_4 ?v1 - type_2 ?v3 - type_2)
	(pred_2 ?v8 - type_1)
	(pred_6 ?v8 - type_1))                                                                                           
(:action op_1 
        :parameters (?v5 - type_2 ?v2 - type_2 ?v7 - type_5)
        :precondition (and (pred_1 ?v7 ?v5) 
                           (pred_4 ?v5 ?v2))                                                          
        :effect (and (not (pred_1 ?v7 ?v5)) (pred_1 ?v7 ?v2)))

(:action op_3 
        :parameters (?v4 - type_2 ?v6 - type_4 ?v7 - type_5)
        :precondition (and (pred_1 ?v7 ?v4) 
                           (pred_1 ?v6 ?v4))
        :effect (and (not (pred_1 ?v6 ?v4))
                     (pred_5 ?v7 ?v6)))

(:action op_2 
        :parameters (?v4 - type_2 ?v6 - type_4 ?v7 - type_5 ?v8 - type_1)
        :precondition (and (pred_1 ?v7 ?v4) 
		      	   (pred_1 ?v8 ?v4)
			   (pred_5 ?v7 ?v6)
			   (pred_3 ?v6)
			   (pred_6 ?v8))
        :effect (and (not (pred_6 ?v8))(not (pred_3 ?v6)) (pred_2 ?v8)))
)