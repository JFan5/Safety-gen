(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v7 ?v6)
		(pred_1 ?v8)
		(pred_2 ?v1)
		(pred_3 ?v1)
		(pred_6 ?v8 ?v1)
		(pred_4)
		(pred_5 ?v8))

   (:action op_3
       :parameters  (?v3 ?v2)
       :precondition (and (not-eq ?v3 ?v2) 
                          (pred_2 ?v3) (pred_2 ?v2) (pred_3 ?v3))
       :effect (and  (pred_3 ?v2)
		     (not (pred_3 ?v3))))


   (:action op_1
       :parameters (?v5 ?v4)
       :precondition  (and  (pred_1 ?v5) (pred_2 ?v4)
			    (pred_6 ?v5 ?v4) (pred_3 ?v4) (pred_4))
       :effect (and (pred_5 ?v5)
		    (not (pred_6 ?v5 ?v4)) 
		    (not (pred_4))))

   (:action op_2
       :parameters  (?v5  ?v4)
       :precondition  (and  (pred_1 ?v5) (pred_2 ?v4)
			    (pred_5 ?v5) (pred_3 ?v4))
       :effect (and (pred_6 ?v5 ?v4)
		    (pred_4)
		    (not (pred_5 ?v5)))))
