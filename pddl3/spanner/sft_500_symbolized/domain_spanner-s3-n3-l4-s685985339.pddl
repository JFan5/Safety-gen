(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_2 type_5 - object
	type_4 type_1 type_3 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_4 ?v6 - type_5 ?v8 - type_2)
	(pred_5 ?v6 - type_4 ?v5 - type_3)
	(pred_2 ?v5 - type_3)
	(pred_6 ?v3 - type_2 ?v2 - type_2)
	(pred_1 ?v7 - type_1)
	(pred_3 ?v7 - type_1))                                                                                           
(:action op_1 
        :parameters (?v1 - type_2 ?v4 - type_2 ?v6 - type_4)
        :precondition (and (pred_4 ?v6 ?v1) 
                           (pred_6 ?v1 ?v4))                                                          
        :effect (and (not (pred_4 ?v6 ?v1)) (pred_4 ?v6 ?v4)))

(:action op_2 
        :parameters (?v8 - type_2 ?v5 - type_3 ?v6 - type_4)
        :precondition (and (pred_4 ?v6 ?v8) 
                           (pred_4 ?v5 ?v8))
        :effect (and (not (pred_4 ?v5 ?v8))
                     (pred_5 ?v6 ?v5)))

(:action op_3 
        :parameters (?v8 - type_2 ?v5 - type_3 ?v6 - type_4 ?v7 - type_1)
        :precondition (and (pred_4 ?v6 ?v8) 
		      	   (pred_4 ?v7 ?v8)
			   (pred_5 ?v6 ?v5)
			   (pred_2 ?v5)
			   (pred_3 ?v7))
        :effect (and (not (pred_3 ?v7))(not (pred_2 ?v5)) (pred_1 ?v7)))
)