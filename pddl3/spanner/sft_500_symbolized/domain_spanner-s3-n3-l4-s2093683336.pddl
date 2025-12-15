(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_1 type_2 - object
	type_4 type_5 type_3 - type_2	
)                                           
                                                                               
(:predicates 
	(pred_3 ?v6 - type_2 ?v8 - type_1)
	(pred_4 ?v6 - type_4 ?v5 - type_3)
	(pred_2 ?v5 - type_3)
	(pred_1 ?v4 - type_1 ?v7 - type_1)
	(pred_6 ?v3 - type_5)
	(pred_5 ?v3 - type_5))                                                                                           
(:action op_3 
        :parameters (?v2 - type_1 ?v1 - type_1 ?v6 - type_4)
        :precondition (and (pred_3 ?v6 ?v2) 
                           (pred_1 ?v2 ?v1))                                                          
        :effect (and (not (pred_3 ?v6 ?v2)) (pred_3 ?v6 ?v1)))

(:action op_1 
        :parameters (?v8 - type_1 ?v5 - type_3 ?v6 - type_4)
        :precondition (and (pred_3 ?v6 ?v8) 
                           (pred_3 ?v5 ?v8))
        :effect (and (not (pred_3 ?v5 ?v8))
                     (pred_4 ?v6 ?v5)))

(:action op_2 
        :parameters (?v8 - type_1 ?v5 - type_3 ?v6 - type_4 ?v3 - type_5)
        :precondition (and (pred_3 ?v6 ?v8) 
		      	   (pred_3 ?v3 ?v8)
			   (pred_4 ?v6 ?v5)
			   (pred_2 ?v5)
			   (pred_5 ?v3))
        :effect (and (not (pred_5 ?v3))(not (pred_2 ?v5)) (pred_6 ?v3)))
)