(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_5 type_2 - object
	type_3 type_4 type_1 - type_2	
)                                           
                                                                               
(:predicates 
	(pred_3 ?v4 - type_2 ?v3 - type_5)
	(pred_2 ?v4 - type_3 ?v6 - type_1)
	(pred_5 ?v6 - type_1)
	(pred_4 ?v1 - type_5 ?v8 - type_5)
	(pred_1 ?v7 - type_4)
	(pred_6 ?v7 - type_4))                                                                                           
(:action op_2 
        :parameters (?v5 - type_5 ?v2 - type_5 ?v4 - type_3)
        :precondition (and (pred_3 ?v4 ?v5) 
                           (pred_4 ?v5 ?v2))                                                          
        :effect (and (not (pred_3 ?v4 ?v5)) (pred_3 ?v4 ?v2)))

(:action op_3 
        :parameters (?v3 - type_5 ?v6 - type_1 ?v4 - type_3)
        :precondition (and (pred_3 ?v4 ?v3) 
                           (pred_3 ?v6 ?v3))
        :effect (and (not (pred_3 ?v6 ?v3))
                     (pred_2 ?v4 ?v6)))

(:action op_1 
        :parameters (?v3 - type_5 ?v6 - type_1 ?v4 - type_3 ?v7 - type_4)
        :precondition (and (pred_3 ?v4 ?v3) 
		      	   (pred_3 ?v7 ?v3)
			   (pred_2 ?v4 ?v6)
			   (pred_5 ?v6)
			   (pred_6 ?v7))
        :effect (and (not (pred_6 ?v7))(not (pred_5 ?v6)) (pred_1 ?v7)))
)