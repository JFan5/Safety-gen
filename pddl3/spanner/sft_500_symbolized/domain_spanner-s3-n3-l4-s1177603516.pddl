(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_4 type_2 - object
	type_5 type_3 type_1 - type_2	
)                                           
                                                                               
(:predicates 
	(pred_6 ?v3 - type_2 ?v7 - type_4)
	(pred_4 ?v3 - type_5 ?v5 - type_1)
	(pred_3 ?v5 - type_1)
	(pred_2 ?v1 - type_4 ?v2 - type_4)
	(pred_5 ?v6 - type_3)
	(pred_1 ?v6 - type_3))                                                                                           
(:action op_1 
        :parameters (?v8 - type_4 ?v4 - type_4 ?v3 - type_5)
        :precondition (and (pred_6 ?v3 ?v8) 
                           (pred_2 ?v8 ?v4))                                                          
        :effect (and (not (pred_6 ?v3 ?v8)) (pred_6 ?v3 ?v4)))

(:action op_2 
        :parameters (?v7 - type_4 ?v5 - type_1 ?v3 - type_5)
        :precondition (and (pred_6 ?v3 ?v7) 
                           (pred_6 ?v5 ?v7))
        :effect (and (not (pred_6 ?v5 ?v7))
                     (pred_4 ?v3 ?v5)))

(:action op_3 
        :parameters (?v7 - type_4 ?v5 - type_1 ?v3 - type_5 ?v6 - type_3)
        :precondition (and (pred_6 ?v3 ?v7) 
		      	   (pred_6 ?v6 ?v7)
			   (pred_4 ?v3 ?v5)
			   (pred_3 ?v5)
			   (pred_1 ?v6))
        :effect (and (not (pred_1 ?v6))(not (pred_3 ?v5)) (pred_5 ?v6)))
)