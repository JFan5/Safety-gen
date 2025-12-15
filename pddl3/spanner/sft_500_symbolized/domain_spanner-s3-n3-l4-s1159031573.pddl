(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_2 type_3 - object
	type_1 type_4 type_5 - type_3	
)                                           
                                                                               
(:predicates 
	(pred_6 ?v6 - type_3 ?v3 - type_2)
	(pred_3 ?v6 - type_1 ?v5 - type_5)
	(pred_1 ?v5 - type_5)
	(pred_4 ?v4 - type_2 ?v7 - type_2)
	(pred_2 ?v8 - type_4)
	(pred_5 ?v8 - type_4))                                                                                           
(:action op_1 
        :parameters (?v2 - type_2 ?v1 - type_2 ?v6 - type_1)
        :precondition (and (pred_6 ?v6 ?v2) 
                           (pred_4 ?v2 ?v1))                                                          
        :effect (and (not (pred_6 ?v6 ?v2)) (pred_6 ?v6 ?v1)))

(:action op_2 
        :parameters (?v3 - type_2 ?v5 - type_5 ?v6 - type_1)
        :precondition (and (pred_6 ?v6 ?v3) 
                           (pred_6 ?v5 ?v3))
        :effect (and (not (pred_6 ?v5 ?v3))
                     (pred_3 ?v6 ?v5)))

(:action op_3 
        :parameters (?v3 - type_2 ?v5 - type_5 ?v6 - type_1 ?v8 - type_4)
        :precondition (and (pred_6 ?v6 ?v3) 
		      	   (pred_6 ?v8 ?v3)
			   (pred_3 ?v6 ?v5)
			   (pred_1 ?v5)
			   (pred_5 ?v8))
        :effect (and (not (pred_5 ?v8))(not (pred_1 ?v5)) (pred_2 ?v8)))
)