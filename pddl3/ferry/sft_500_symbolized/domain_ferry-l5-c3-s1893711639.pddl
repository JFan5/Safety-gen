(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v7 ?v6)
		(pred_6 ?v5)
		(pred_3 ?v3)
		(pred_4 ?v3)
		(pred_2 ?v5 ?v3)
		(pred_5)
		(pred_1 ?v5))

   (:action op_2
       :parameters  (?v4 ?v1)
       :precondition (and (not-eq ?v4 ?v1) 
                          (pred_3 ?v4) (pred_3 ?v1) (pred_4 ?v4))
       :effect (and  (pred_4 ?v1)
		     (not (pred_4 ?v4))))


   (:action op_1
       :parameters (?v8 ?v2)
       :precondition  (and  (pred_6 ?v8) (pred_3 ?v2)
			    (pred_2 ?v8 ?v2) (pred_4 ?v2) (pred_5))
       :effect (and (pred_1 ?v8)
		    (not (pred_2 ?v8 ?v2)) 
		    (not (pred_5))))

   (:action op_3
       :parameters  (?v8  ?v2)
       :precondition  (and  (pred_6 ?v8) (pred_3 ?v2)
			    (pred_1 ?v8) (pred_4 ?v2))
       :effect (and (pred_2 ?v8 ?v2)
		    (pred_5)
		    (not (pred_1 ?v8)))))
