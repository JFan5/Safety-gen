(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v8 ?v3)
		(pred_2 ?v1)
		(pred_6 ?v5)
		(pred_5 ?v5)
		(pred_3 ?v1 ?v5)
		(pred_1)
		(pred_4 ?v1))

   (:action op_2
       :parameters  (?v2 ?v6)
       :precondition (and (not-eq ?v2 ?v6) 
                          (pred_6 ?v2) (pred_6 ?v6) (pred_5 ?v2))
       :effect (and  (pred_5 ?v6)
		     (not (pred_5 ?v2))))


   (:action op_3
       :parameters (?v7 ?v4)
       :precondition  (and  (pred_2 ?v7) (pred_6 ?v4)
			    (pred_3 ?v7 ?v4) (pred_5 ?v4) (pred_1))
       :effect (and (pred_4 ?v7)
		    (not (pred_3 ?v7 ?v4)) 
		    (not (pred_1))))

   (:action op_1
       :parameters  (?v7  ?v4)
       :precondition  (and  (pred_2 ?v7) (pred_6 ?v4)
			    (pred_4 ?v7) (pred_5 ?v4))
       :effect (and (pred_3 ?v7 ?v4)
		    (pred_1)
		    (not (pred_4 ?v7)))))
