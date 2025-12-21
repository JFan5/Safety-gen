(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_5 type_2 - object
	type_4 type_1 type_3 - type_2	
)                                           
                                                                               
(:predicates 
	(pred_2 ?v3 - type_2 ?v1 - type_5)
	(pred_5 ?v3 - type_4 ?v2 - type_3)
	(pred_4 ?v2 - type_3)
	(pred_6 ?v8 - type_5 ?v7 - type_5)
	(pred_3 ?v6 - type_1)
	(pred_1 ?v6 - type_1))                                                                                           
(:action op_3 
        :parameters (?v5 - type_5 ?v4 - type_5 ?v3 - type_4)
        :precondition (and (pred_2 ?v3 ?v5) 
                           (pred_6 ?v5 ?v4))                                                          
        :effect (and (not (pred_2 ?v3 ?v5)) (pred_2 ?v3 ?v4)))

(:action op_2 
        :parameters (?v1 - type_5 ?v2 - type_3 ?v3 - type_4)
        :precondition (and (pred_2 ?v3 ?v1) 
                           (pred_2 ?v2 ?v1))
        :effect (and (not (pred_2 ?v2 ?v1))
                     (pred_5 ?v3 ?v2)))

(:action op_1 
        :parameters (?v1 - type_5 ?v2 - type_3 ?v3 - type_4 ?v6 - type_1)
        :precondition (and (pred_2 ?v3 ?v1) 
		      	   (pred_2 ?v6 ?v1)
			   (pred_5 ?v3 ?v2)
			   (pred_4 ?v2)
			   (pred_1 ?v6))
        :effect (and (not (pred_1 ?v6))(not (pred_4 ?v2)) (pred_3 ?v6)))
)