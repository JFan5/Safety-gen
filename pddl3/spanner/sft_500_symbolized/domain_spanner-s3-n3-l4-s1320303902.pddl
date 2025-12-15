(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_1 type_2 - object
	type_3 type_4 type_5 - type_2	
)                                           
                                                                               
(:predicates 
	(pred_3 ?v2 - type_2 ?v7 - type_1)
	(pred_2 ?v2 - type_3 ?v6 - type_5)
	(pred_4 ?v6 - type_5)
	(pred_6 ?v1 - type_1 ?v8 - type_1)
	(pred_5 ?v5 - type_4)
	(pred_1 ?v5 - type_4))                                                                                           
(:action op_1 
        :parameters (?v3 - type_1 ?v4 - type_1 ?v2 - type_3)
        :precondition (and (pred_3 ?v2 ?v3) 
                           (pred_6 ?v3 ?v4))                                                          
        :effect (and (not (pred_3 ?v2 ?v3)) (pred_3 ?v2 ?v4)))

(:action op_2 
        :parameters (?v7 - type_1 ?v6 - type_5 ?v2 - type_3)
        :precondition (and (pred_3 ?v2 ?v7) 
                           (pred_3 ?v6 ?v7))
        :effect (and (not (pred_3 ?v6 ?v7))
                     (pred_2 ?v2 ?v6)))

(:action op_3 
        :parameters (?v7 - type_1 ?v6 - type_5 ?v2 - type_3 ?v5 - type_4)
        :precondition (and (pred_3 ?v2 ?v7) 
		      	   (pred_3 ?v5 ?v7)
			   (pred_2 ?v2 ?v6)
			   (pred_4 ?v6)
			   (pred_1 ?v5))
        :effect (and (not (pred_1 ?v5))(not (pred_4 ?v6)) (pred_5 ?v5)))
)