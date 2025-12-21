(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_4 type_5 - object
	type_2 type_1 type_3 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_5 ?v5 - type_5 ?v3 - type_4)
	(pred_4 ?v5 - type_2 ?v6 - type_3)
	(pred_2 ?v6 - type_3)
	(pred_3 ?v7 - type_4 ?v2 - type_4)
	(pred_6 ?v4 - type_1)
	(pred_1 ?v4 - type_1))                                                                                           
(:action op_1 
        :parameters (?v1 - type_4 ?v8 - type_4 ?v5 - type_2)
        :precondition (and (pred_5 ?v5 ?v1) 
                           (pred_3 ?v1 ?v8))                                                          
        :effect (and (not (pred_5 ?v5 ?v1)) (pred_5 ?v5 ?v8)))

(:action op_3 
        :parameters (?v3 - type_4 ?v6 - type_3 ?v5 - type_2)
        :precondition (and (pred_5 ?v5 ?v3) 
                           (pred_5 ?v6 ?v3))
        :effect (and (not (pred_5 ?v6 ?v3))
                     (pred_4 ?v5 ?v6)))

(:action op_2 
        :parameters (?v3 - type_4 ?v6 - type_3 ?v5 - type_2 ?v4 - type_1)
        :precondition (and (pred_5 ?v5 ?v3) 
		      	   (pred_5 ?v4 ?v3)
			   (pred_4 ?v5 ?v6)
			   (pred_2 ?v6)
			   (pred_1 ?v4))
        :effect (and (not (pred_1 ?v4))(not (pred_2 ?v6)) (pred_6 ?v4)))
)