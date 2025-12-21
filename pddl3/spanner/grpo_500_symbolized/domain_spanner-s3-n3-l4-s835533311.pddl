(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_4 type_2 - object
	type_5 type_3 type_1 - type_2	
)                                           
                                                                               
(:predicates 
	(pred_1 ?v6 - type_2 ?v7 - type_4)
	(pred_4 ?v6 - type_5 ?v3 - type_1)
	(pred_5 ?v3 - type_1)
	(pred_3 ?v1 - type_4 ?v5 - type_4)
	(pred_6 ?v4 - type_3)
	(pred_2 ?v4 - type_3))                                                                                           
(:action op_1 
        :parameters (?v2 - type_4 ?v8 - type_4 ?v6 - type_5)
        :precondition (and (pred_1 ?v6 ?v2) 
                           (pred_3 ?v2 ?v8))                                                          
        :effect (and (not (pred_1 ?v6 ?v2)) (pred_1 ?v6 ?v8)))

(:action op_3 
        :parameters (?v7 - type_4 ?v3 - type_1 ?v6 - type_5)
        :precondition (and (pred_1 ?v6 ?v7) 
                           (pred_1 ?v3 ?v7))
        :effect (and (not (pred_1 ?v3 ?v7))
                     (pred_4 ?v6 ?v3)))

(:action op_2 
        :parameters (?v7 - type_4 ?v3 - type_1 ?v6 - type_5 ?v4 - type_3)
        :precondition (and (pred_1 ?v6 ?v7) 
		      	   (pred_1 ?v4 ?v7)
			   (pred_4 ?v6 ?v3)
			   (pred_5 ?v3)
			   (pred_2 ?v4))
        :effect (and (not (pred_2 ?v4))(not (pred_5 ?v3)) (pred_6 ?v4)))
)