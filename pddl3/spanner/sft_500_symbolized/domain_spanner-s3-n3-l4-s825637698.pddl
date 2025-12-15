(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_4 type_3 - object
	type_2 type_1 type_5 - type_3	
)                                           
                                                                               
(:predicates 
	(pred_4 ?v2 - type_3 ?v3 - type_4)
	(pred_5 ?v2 - type_2 ?v6 - type_5)
	(pred_2 ?v6 - type_5)
	(pred_6 ?v8 - type_4 ?v4 - type_4)
	(pred_1 ?v5 - type_1)
	(pred_3 ?v5 - type_1))                                                                                           
(:action op_3 
        :parameters (?v7 - type_4 ?v1 - type_4 ?v2 - type_2)
        :precondition (and (pred_4 ?v2 ?v7) 
                           (pred_6 ?v7 ?v1))                                                          
        :effect (and (not (pred_4 ?v2 ?v7)) (pred_4 ?v2 ?v1)))

(:action op_1 
        :parameters (?v3 - type_4 ?v6 - type_5 ?v2 - type_2)
        :precondition (and (pred_4 ?v2 ?v3) 
                           (pred_4 ?v6 ?v3))
        :effect (and (not (pred_4 ?v6 ?v3))
                     (pred_5 ?v2 ?v6)))

(:action op_2 
        :parameters (?v3 - type_4 ?v6 - type_5 ?v2 - type_2 ?v5 - type_1)
        :precondition (and (pred_4 ?v2 ?v3) 
		      	   (pred_4 ?v5 ?v3)
			   (pred_5 ?v2 ?v6)
			   (pred_2 ?v6)
			   (pred_3 ?v5))
        :effect (and (not (pred_3 ?v5))(not (pred_2 ?v6)) (pred_1 ?v5)))
)