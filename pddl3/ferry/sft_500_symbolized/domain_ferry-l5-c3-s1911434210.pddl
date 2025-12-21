(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v1 ?v8)
		(pred_3 ?v6)
		(pred_1 ?v3)
		(pred_6 ?v3)
		(pred_5 ?v6 ?v3)
		(pred_2)
		(pred_4 ?v6))

   (:action op_2
       :parameters  (?v2 ?v5)
       :precondition (and (not-eq ?v2 ?v5) 
                          (pred_1 ?v2) (pred_1 ?v5) (pred_6 ?v2))
       :effect (and  (pred_6 ?v5)
		     (not (pred_6 ?v2))))


   (:action op_1
       :parameters (?v7 ?v4)
       :precondition  (and  (pred_3 ?v7) (pred_1 ?v4)
			    (pred_5 ?v7 ?v4) (pred_6 ?v4) (pred_2))
       :effect (and (pred_4 ?v7)
		    (not (pred_5 ?v7 ?v4)) 
		    (not (pred_2))))

   (:action op_3
       :parameters  (?v7  ?v4)
       :precondition  (and  (pred_3 ?v7) (pred_1 ?v4)
			    (pred_4 ?v7) (pred_6 ?v4))
       :effect (and (pred_5 ?v7 ?v4)
		    (pred_2)
		    (not (pred_4 ?v7)))))
