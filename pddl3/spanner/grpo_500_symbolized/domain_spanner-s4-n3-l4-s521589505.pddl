(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_1 type_4 - object
	type_3 type_5 type_2 - type_4	
)                                           
                                                                               
(:predicates 
	(pred_6 ?v3 - type_4 ?v7 - type_1)
	(pred_4 ?v3 - type_3 ?v6 - type_2)
	(pred_5 ?v6 - type_2)
	(pred_2 ?v4 - type_1 ?v1 - type_1)
	(pred_1 ?v5 - type_5)
	(pred_3 ?v5 - type_5))                                                                                           
(:action op_3 
        :parameters (?v2 - type_1 ?v8 - type_1 ?v3 - type_3)
        :precondition (and (pred_6 ?v3 ?v2) 
                           (pred_2 ?v2 ?v8))                                                          
        :effect (and (not (pred_6 ?v3 ?v2)) (pred_6 ?v3 ?v8)))

(:action op_2 
        :parameters (?v7 - type_1 ?v6 - type_2 ?v3 - type_3)
        :precondition (and (pred_6 ?v3 ?v7) 
                           (pred_6 ?v6 ?v7))
        :effect (and (not (pred_6 ?v6 ?v7))
                     (pred_4 ?v3 ?v6)))

(:action op_1 
        :parameters (?v7 - type_1 ?v6 - type_2 ?v3 - type_3 ?v5 - type_5)
        :precondition (and (pred_6 ?v3 ?v7) 
		      	   (pred_6 ?v5 ?v7)
			   (pred_4 ?v3 ?v6)
			   (pred_5 ?v6)
			   (pred_3 ?v5))
        :effect (and (not (pred_3 ?v5))(not (pred_5 ?v6)) (pred_1 ?v5)))
)