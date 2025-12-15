(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_2 type_1 - object
	type_5 type_4 type_3 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_6 ?v1 - type_1 ?v7 - type_2)
	(pred_5 ?v1 - type_5 ?v5 - type_3)
	(pred_3 ?v5 - type_3)
	(pred_2 ?v2 - type_2 ?v3 - type_2)
	(pred_1 ?v6 - type_4)
	(pred_4 ?v6 - type_4))                                                                                           
(:action op_3 
        :parameters (?v4 - type_2 ?v8 - type_2 ?v1 - type_5)
        :precondition (and (pred_6 ?v1 ?v4) 
                           (pred_2 ?v4 ?v8))                                                          
        :effect (and (not (pred_6 ?v1 ?v4)) (pred_6 ?v1 ?v8)))

(:action op_1 
        :parameters (?v7 - type_2 ?v5 - type_3 ?v1 - type_5)
        :precondition (and (pred_6 ?v1 ?v7) 
                           (pred_6 ?v5 ?v7))
        :effect (and (not (pred_6 ?v5 ?v7))
                     (pred_5 ?v1 ?v5)))

(:action op_2 
        :parameters (?v7 - type_2 ?v5 - type_3 ?v1 - type_5 ?v6 - type_4)
        :precondition (and (pred_6 ?v1 ?v7) 
		      	   (pred_6 ?v6 ?v7)
			   (pred_5 ?v1 ?v5)
			   (pred_3 ?v5)
			   (pred_4 ?v6))
        :effect (and (not (pred_4 ?v6))(not (pred_3 ?v5)) (pred_1 ?v6)))
)