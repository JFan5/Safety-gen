(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_5 type_1 - object
	type_2 type_4 type_3 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_4 ?v7 - type_1 ?v4 - type_5)
	(pred_1 ?v7 - type_2 ?v6 - type_3)
	(pred_6 ?v6 - type_3)
	(pred_3 ?v1 - type_5 ?v3 - type_5)
	(pred_2 ?v5 - type_4)
	(pred_5 ?v5 - type_4))                                                                                           
(:action op_2 
        :parameters (?v2 - type_5 ?v8 - type_5 ?v7 - type_2)
        :precondition (and (pred_4 ?v7 ?v2) 
                           (pred_3 ?v2 ?v8))                                                          
        :effect (and (not (pred_4 ?v7 ?v2)) (pred_4 ?v7 ?v8)))

(:action op_3 
        :parameters (?v4 - type_5 ?v6 - type_3 ?v7 - type_2)
        :precondition (and (pred_4 ?v7 ?v4) 
                           (pred_4 ?v6 ?v4))
        :effect (and (not (pred_4 ?v6 ?v4))
                     (pred_1 ?v7 ?v6)))

(:action op_1 
        :parameters (?v4 - type_5 ?v6 - type_3 ?v7 - type_2 ?v5 - type_4)
        :precondition (and (pred_4 ?v7 ?v4) 
		      	   (pred_4 ?v5 ?v4)
			   (pred_1 ?v7 ?v6)
			   (pred_6 ?v6)
			   (pred_5 ?v5))
        :effect (and (not (pred_5 ?v5))(not (pred_6 ?v6)) (pred_2 ?v5)))
)