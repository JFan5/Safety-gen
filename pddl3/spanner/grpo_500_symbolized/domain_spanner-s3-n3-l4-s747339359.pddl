(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_4 type_1 - object
	type_2 type_5 type_3 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_2 ?v2 - type_1 ?v8 - type_4)
	(pred_5 ?v2 - type_2 ?v6 - type_3)
	(pred_3 ?v6 - type_3)
	(pred_1 ?v4 - type_4 ?v3 - type_4)
	(pred_4 ?v1 - type_5)
	(pred_6 ?v1 - type_5))                                                                                           
(:action op_1 
        :parameters (?v5 - type_4 ?v7 - type_4 ?v2 - type_2)
        :precondition (and (pred_2 ?v2 ?v5) 
                           (pred_1 ?v5 ?v7))                                                          
        :effect (and (not (pred_2 ?v2 ?v5)) (pred_2 ?v2 ?v7)))

(:action op_2 
        :parameters (?v8 - type_4 ?v6 - type_3 ?v2 - type_2)
        :precondition (and (pred_2 ?v2 ?v8) 
                           (pred_2 ?v6 ?v8))
        :effect (and (not (pred_2 ?v6 ?v8))
                     (pred_5 ?v2 ?v6)))

(:action op_3 
        :parameters (?v8 - type_4 ?v6 - type_3 ?v2 - type_2 ?v1 - type_5)
        :precondition (and (pred_2 ?v2 ?v8) 
		      	   (pred_2 ?v1 ?v8)
			   (pred_5 ?v2 ?v6)
			   (pred_3 ?v6)
			   (pred_6 ?v1))
        :effect (and (not (pred_6 ?v1))(not (pred_3 ?v6)) (pred_4 ?v1)))
)