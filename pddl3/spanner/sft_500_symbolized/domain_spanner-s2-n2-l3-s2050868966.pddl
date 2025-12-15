(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_5 type_1 - object
	type_3 type_2 type_4 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_3 ?v3 - type_1 ?v7 - type_5)
	(pred_1 ?v3 - type_3 ?v6 - type_4)
	(pred_6 ?v6 - type_4)
	(pred_2 ?v4 - type_5 ?v1 - type_5)
	(pred_5 ?v5 - type_2)
	(pred_4 ?v5 - type_2))                                                                                           
(:action op_2 
        :parameters (?v8 - type_5 ?v2 - type_5 ?v3 - type_3)
        :precondition (and (pred_3 ?v3 ?v8) 
                           (pred_2 ?v8 ?v2))                                                          
        :effect (and (not (pred_3 ?v3 ?v8)) (pred_3 ?v3 ?v2)))

(:action op_3 
        :parameters (?v7 - type_5 ?v6 - type_4 ?v3 - type_3)
        :precondition (and (pred_3 ?v3 ?v7) 
                           (pred_3 ?v6 ?v7))
        :effect (and (not (pred_3 ?v6 ?v7))
                     (pred_1 ?v3 ?v6)))

(:action op_1 
        :parameters (?v7 - type_5 ?v6 - type_4 ?v3 - type_3 ?v5 - type_2)
        :precondition (and (pred_3 ?v3 ?v7) 
		      	   (pred_3 ?v5 ?v7)
			   (pred_1 ?v3 ?v6)
			   (pred_6 ?v6)
			   (pred_4 ?v5))
        :effect (and (not (pred_4 ?v5))(not (pred_6 ?v6)) (pred_5 ?v5)))
)