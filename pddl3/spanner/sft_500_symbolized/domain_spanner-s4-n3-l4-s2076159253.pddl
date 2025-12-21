(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_4 type_2 - object
	type_5 type_3 type_1 - type_2	
)                                           
                                                                               
(:predicates 
	(pred_4 ?v1 - type_2 ?v7 - type_4)
	(pred_5 ?v1 - type_5 ?v2 - type_1)
	(pred_2 ?v2 - type_1)
	(pred_1 ?v8 - type_4 ?v4 - type_4)
	(pred_3 ?v6 - type_3)
	(pred_6 ?v6 - type_3))                                                                                           
(:action op_3 
        :parameters (?v3 - type_4 ?v5 - type_4 ?v1 - type_5)
        :precondition (and (pred_4 ?v1 ?v3) 
                           (pred_1 ?v3 ?v5))                                                          
        :effect (and (not (pred_4 ?v1 ?v3)) (pred_4 ?v1 ?v5)))

(:action op_1 
        :parameters (?v7 - type_4 ?v2 - type_1 ?v1 - type_5)
        :precondition (and (pred_4 ?v1 ?v7) 
                           (pred_4 ?v2 ?v7))
        :effect (and (not (pred_4 ?v2 ?v7))
                     (pred_5 ?v1 ?v2)))

(:action op_2 
        :parameters (?v7 - type_4 ?v2 - type_1 ?v1 - type_5 ?v6 - type_3)
        :precondition (and (pred_4 ?v1 ?v7) 
		      	   (pred_4 ?v6 ?v7)
			   (pred_5 ?v1 ?v2)
			   (pred_2 ?v2)
			   (pred_6 ?v6))
        :effect (and (not (pred_6 ?v6))(not (pred_2 ?v2)) (pred_3 ?v6)))
)