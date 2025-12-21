(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_4 type_5 - object
	type_3 type_1 type_2 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_2 ?v3 - type_5 ?v7 - type_4)
	(pred_5 ?v3 - type_3 ?v2 - type_2)
	(pred_4 ?v2 - type_2)
	(pred_1 ?v4 - type_4 ?v1 - type_4)
	(pred_6 ?v6 - type_1)
	(pred_3 ?v6 - type_1))                                                                                           
(:action op_2 
        :parameters (?v8 - type_4 ?v5 - type_4 ?v3 - type_3)
        :precondition (and (pred_2 ?v3 ?v8) 
                           (pred_1 ?v8 ?v5))                                                          
        :effect (and (not (pred_2 ?v3 ?v8)) (pred_2 ?v3 ?v5)))

(:action op_3 
        :parameters (?v7 - type_4 ?v2 - type_2 ?v3 - type_3)
        :precondition (and (pred_2 ?v3 ?v7) 
                           (pred_2 ?v2 ?v7))
        :effect (and (not (pred_2 ?v2 ?v7))
                     (pred_5 ?v3 ?v2)))

(:action op_1 
        :parameters (?v7 - type_4 ?v2 - type_2 ?v3 - type_3 ?v6 - type_1)
        :precondition (and (pred_2 ?v3 ?v7) 
		      	   (pred_2 ?v6 ?v7)
			   (pred_5 ?v3 ?v2)
			   (pred_4 ?v2)
			   (pred_3 ?v6))
        :effect (and (not (pred_3 ?v6))(not (pred_4 ?v2)) (pred_6 ?v6)))
)