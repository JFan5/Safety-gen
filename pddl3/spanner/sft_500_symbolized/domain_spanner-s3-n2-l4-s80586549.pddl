(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_5 type_3 - object
	type_2 type_4 type_1 - type_3	
)                                           
                                                                               
(:predicates 
	(pred_1 ?v5 - type_3 ?v7 - type_5)
	(pred_4 ?v5 - type_2 ?v6 - type_1)
	(pred_2 ?v6 - type_1)
	(pred_5 ?v3 - type_5 ?v1 - type_5)
	(pred_3 ?v8 - type_4)
	(pred_6 ?v8 - type_4))                                                                                           
(:action op_2 
        :parameters (?v2 - type_5 ?v4 - type_5 ?v5 - type_2)
        :precondition (and (pred_1 ?v5 ?v2) 
                           (pred_5 ?v2 ?v4))                                                          
        :effect (and (not (pred_1 ?v5 ?v2)) (pred_1 ?v5 ?v4)))

(:action op_1 
        :parameters (?v7 - type_5 ?v6 - type_1 ?v5 - type_2)
        :precondition (and (pred_1 ?v5 ?v7) 
                           (pred_1 ?v6 ?v7))
        :effect (and (not (pred_1 ?v6 ?v7))
                     (pred_4 ?v5 ?v6)))

(:action op_3 
        :parameters (?v7 - type_5 ?v6 - type_1 ?v5 - type_2 ?v8 - type_4)
        :precondition (and (pred_1 ?v5 ?v7) 
		      	   (pred_1 ?v8 ?v7)
			   (pred_4 ?v5 ?v6)
			   (pred_2 ?v6)
			   (pred_6 ?v8))
        :effect (and (not (pred_6 ?v8))(not (pred_2 ?v6)) (pred_3 ?v8)))
)