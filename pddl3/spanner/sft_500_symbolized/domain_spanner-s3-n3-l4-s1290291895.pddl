(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_2 - object
	type_5 type_1 type_4 - type_2	
)                                           
                                                                               
(:predicates 
	(pred_4 ?v8 - type_2 ?v4 - type_3)
	(pred_1 ?v8 - type_5 ?v5 - type_4)
	(pred_5 ?v5 - type_4)
	(pred_6 ?v7 - type_3 ?v1 - type_3)
	(pred_2 ?v6 - type_1)
	(pred_3 ?v6 - type_1))                                                                                           
(:action op_1 
        :parameters (?v2 - type_3 ?v3 - type_3 ?v8 - type_5)
        :precondition (and (pred_4 ?v8 ?v2) 
                           (pred_6 ?v2 ?v3))                                                          
        :effect (and (not (pred_4 ?v8 ?v2)) (pred_4 ?v8 ?v3)))

(:action op_2 
        :parameters (?v4 - type_3 ?v5 - type_4 ?v8 - type_5)
        :precondition (and (pred_4 ?v8 ?v4) 
                           (pred_4 ?v5 ?v4))
        :effect (and (not (pred_4 ?v5 ?v4))
                     (pred_1 ?v8 ?v5)))

(:action op_3 
        :parameters (?v4 - type_3 ?v5 - type_4 ?v8 - type_5 ?v6 - type_1)
        :precondition (and (pred_4 ?v8 ?v4) 
		      	   (pred_4 ?v6 ?v4)
			   (pred_1 ?v8 ?v5)
			   (pred_5 ?v5)
			   (pred_3 ?v6))
        :effect (and (not (pred_3 ?v6))(not (pred_5 ?v5)) (pred_2 ?v6)))
)