(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_2 - object
	type_4 type_1 type_5 - type_2	
)                                           
                                                                               
(:predicates 
	(pred_6 ?v7 - type_2 ?v4 - type_3)
	(pred_3 ?v7 - type_4 ?v6 - type_5)
	(pred_2 ?v6 - type_5)
	(pred_4 ?v8 - type_3 ?v1 - type_3)
	(pred_5 ?v2 - type_1)
	(pred_1 ?v2 - type_1))                                                                                           
(:action op_1 
        :parameters (?v3 - type_3 ?v5 - type_3 ?v7 - type_4)
        :precondition (and (pred_6 ?v7 ?v3) 
                           (pred_4 ?v3 ?v5))                                                          
        :effect (and (not (pred_6 ?v7 ?v3)) (pred_6 ?v7 ?v5)))

(:action op_3 
        :parameters (?v4 - type_3 ?v6 - type_5 ?v7 - type_4)
        :precondition (and (pred_6 ?v7 ?v4) 
                           (pred_6 ?v6 ?v4))
        :effect (and (not (pred_6 ?v6 ?v4))
                     (pred_3 ?v7 ?v6)))

(:action op_2 
        :parameters (?v4 - type_3 ?v6 - type_5 ?v7 - type_4 ?v2 - type_1)
        :precondition (and (pred_6 ?v7 ?v4) 
		      	   (pred_6 ?v2 ?v4)
			   (pred_3 ?v7 ?v6)
			   (pred_2 ?v6)
			   (pred_1 ?v2))
        :effect (and (not (pred_1 ?v2))(not (pred_2 ?v6)) (pred_5 ?v2)))
)