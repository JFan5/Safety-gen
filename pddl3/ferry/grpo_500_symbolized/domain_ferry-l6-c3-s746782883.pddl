(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v8 ?v7)
		(pred_4 ?v3)
		(pred_3 ?v2)
		(pred_1 ?v2)
		(pred_6 ?v3 ?v2)
		(pred_2)
		(pred_5 ?v3))

   (:action op_3
       :parameters  (?v4 ?v1)
       :precondition (and (not-eq ?v4 ?v1) 
                          (pred_3 ?v4) (pred_3 ?v1) (pred_1 ?v4))
       :effect (and  (pred_1 ?v1)
		     (not (pred_1 ?v4))))


   (:action op_2
       :parameters (?v6 ?v5)
       :precondition  (and  (pred_4 ?v6) (pred_3 ?v5)
			    (pred_6 ?v6 ?v5) (pred_1 ?v5) (pred_2))
       :effect (and (pred_5 ?v6)
		    (not (pred_6 ?v6 ?v5)) 
		    (not (pred_2))))

   (:action op_1
       :parameters  (?v6  ?v5)
       :precondition  (and  (pred_4 ?v6) (pred_3 ?v5)
			    (pred_5 ?v6) (pred_1 ?v5))
       :effect (and (pred_6 ?v6 ?v5)
		    (pred_2)
		    (not (pred_5 ?v6)))))
