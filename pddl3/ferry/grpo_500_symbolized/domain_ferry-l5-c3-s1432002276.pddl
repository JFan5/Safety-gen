(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v1 ?v8)
		(pred_5 ?v7)
		(pred_1 ?v5)
		(pred_6 ?v5)
		(pred_2 ?v7 ?v5)
		(pred_4)
		(pred_3 ?v7))

   (:action op_1
       :parameters  (?v2 ?v3)
       :precondition (and (not-eq ?v2 ?v3) 
                          (pred_1 ?v2) (pred_1 ?v3) (pred_6 ?v2))
       :effect (and  (pred_6 ?v3)
		     (not (pred_6 ?v2))))


   (:action op_2
       :parameters (?v6 ?v4)
       :precondition  (and  (pred_5 ?v6) (pred_1 ?v4)
			    (pred_2 ?v6 ?v4) (pred_6 ?v4) (pred_4))
       :effect (and (pred_3 ?v6)
		    (not (pred_2 ?v6 ?v4)) 
		    (not (pred_4))))

   (:action op_3
       :parameters  (?v6  ?v4)
       :precondition  (and  (pred_5 ?v6) (pred_1 ?v4)
			    (pred_3 ?v6) (pred_6 ?v4))
       :effect (and (pred_2 ?v6 ?v4)
		    (pred_4)
		    (not (pred_3 ?v6)))))
