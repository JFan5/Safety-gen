(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v8 ?v1)
		(pred_2 ?v7)
		(pred_4 ?v4)
		(pred_6 ?v4)
		(pred_3 ?v7 ?v4)
		(pred_1)
		(pred_5 ?v7))

   (:action op_3
       :parameters  (?v2 ?v3)
       :precondition (and (not-eq ?v2 ?v3) 
                          (pred_4 ?v2) (pred_4 ?v3) (pred_6 ?v2))
       :effect (and  (pred_6 ?v3)
		     (not (pred_6 ?v2))))


   (:action op_2
       :parameters (?v5 ?v6)
       :precondition  (and  (pred_2 ?v5) (pred_4 ?v6)
			    (pred_3 ?v5 ?v6) (pred_6 ?v6) (pred_1))
       :effect (and (pred_5 ?v5)
		    (not (pred_3 ?v5 ?v6)) 
		    (not (pred_1))))

   (:action op_1
       :parameters  (?v5  ?v6)
       :precondition  (and  (pred_2 ?v5) (pred_4 ?v6)
			    (pred_5 ?v5) (pred_6 ?v6))
       :effect (and (pred_3 ?v5 ?v6)
		    (pred_1)
		    (not (pred_5 ?v5)))))
