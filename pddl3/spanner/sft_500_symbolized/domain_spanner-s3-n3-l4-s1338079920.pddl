(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_1 type_2 - object
	type_3 type_4 type_5 - type_2	
)                                           
                                                                               
(:predicates 
	(pred_5 ?v6 - type_2 ?v3 - type_1)
	(pred_6 ?v6 - type_3 ?v5 - type_5)
	(pred_4 ?v5 - type_5)
	(pred_2 ?v2 - type_1 ?v7 - type_1)
	(pred_3 ?v1 - type_4)
	(pred_1 ?v1 - type_4))                                                                                           
(:action op_3 
        :parameters (?v4 - type_1 ?v8 - type_1 ?v6 - type_3)
        :precondition (and (pred_5 ?v6 ?v4) 
                           (pred_2 ?v4 ?v8))                                                          
        :effect (and (not (pred_5 ?v6 ?v4)) (pred_5 ?v6 ?v8)))

(:action op_1 
        :parameters (?v3 - type_1 ?v5 - type_5 ?v6 - type_3)
        :precondition (and (pred_5 ?v6 ?v3) 
                           (pred_5 ?v5 ?v3))
        :effect (and (not (pred_5 ?v5 ?v3))
                     (pred_6 ?v6 ?v5)))

(:action op_2 
        :parameters (?v3 - type_1 ?v5 - type_5 ?v6 - type_3 ?v1 - type_4)
        :precondition (and (pred_5 ?v6 ?v3) 
		      	   (pred_5 ?v1 ?v3)
			   (pred_6 ?v6 ?v5)
			   (pred_4 ?v5)
			   (pred_1 ?v1))
        :effect (and (not (pred_1 ?v1))(not (pred_4 ?v5)) (pred_3 ?v1)))
)