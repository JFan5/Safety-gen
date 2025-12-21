(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_5 - object
	type_2 type_4 type_1 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_4 ?v3 - type_5 ?v7 - type_3)
	(pred_2 ?v3 - type_2 ?v5 - type_1)
	(pred_6 ?v5 - type_1)
	(pred_5 ?v1 - type_3 ?v2 - type_3)
	(pred_1 ?v6 - type_4)
	(pred_3 ?v6 - type_4))                                                                                           
(:action op_3 
        :parameters (?v4 - type_3 ?v8 - type_3 ?v3 - type_2)
        :precondition (and (pred_4 ?v3 ?v4) 
                           (pred_5 ?v4 ?v8))                                                          
        :effect (and (not (pred_4 ?v3 ?v4)) (pred_4 ?v3 ?v8)))

(:action op_2 
        :parameters (?v7 - type_3 ?v5 - type_1 ?v3 - type_2)
        :precondition (and (pred_4 ?v3 ?v7) 
                           (pred_4 ?v5 ?v7))
        :effect (and (not (pred_4 ?v5 ?v7))
                     (pred_2 ?v3 ?v5)))

(:action op_1 
        :parameters (?v7 - type_3 ?v5 - type_1 ?v3 - type_2 ?v6 - type_4)
        :precondition (and (pred_4 ?v3 ?v7) 
		      	   (pred_4 ?v6 ?v7)
			   (pred_2 ?v3 ?v5)
			   (pred_6 ?v5)
			   (pred_3 ?v6))
        :effect (and (not (pred_3 ?v6))(not (pred_6 ?v5)) (pred_1 ?v6)))
)