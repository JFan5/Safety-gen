(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_1 type_2 - object
	type_3 type_5 type_4 - type_2	
)                                           
                                                                               
(:predicates 
	(pred_1 ?v2 - type_2 ?v5 - type_1)
	(pred_2 ?v2 - type_3 ?v6 - type_4)
	(pred_6 ?v6 - type_4)
	(pred_3 ?v8 - type_1 ?v7 - type_1)
	(pred_4 ?v1 - type_5)
	(pred_5 ?v1 - type_5))                                                                                           
(:action op_3 
        :parameters (?v3 - type_1 ?v4 - type_1 ?v2 - type_3)
        :precondition (and (pred_1 ?v2 ?v3) 
                           (pred_3 ?v3 ?v4))                                                          
        :effect (and (not (pred_1 ?v2 ?v3)) (pred_1 ?v2 ?v4)))

(:action op_1 
        :parameters (?v5 - type_1 ?v6 - type_4 ?v2 - type_3)
        :precondition (and (pred_1 ?v2 ?v5) 
                           (pred_1 ?v6 ?v5))
        :effect (and (not (pred_1 ?v6 ?v5))
                     (pred_2 ?v2 ?v6)))

(:action op_2 
        :parameters (?v5 - type_1 ?v6 - type_4 ?v2 - type_3 ?v1 - type_5)
        :precondition (and (pred_1 ?v2 ?v5) 
		      	   (pred_1 ?v1 ?v5)
			   (pred_2 ?v2 ?v6)
			   (pred_6 ?v6)
			   (pred_5 ?v1))
        :effect (and (not (pred_5 ?v1))(not (pred_6 ?v6)) (pred_4 ?v1)))
)