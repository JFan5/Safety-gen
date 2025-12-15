(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v3 ?v1)
		(pred_1 ?v4)
		(pred_2 ?v7)
		(pred_3 ?v7)
		(pred_5 ?v4 ?v7)
		(pred_4)
		(pred_6 ?v4))

   (:action op_2
       :parameters  (?v2 ?v6)
       :precondition (and (not-eq ?v2 ?v6) 
                          (pred_2 ?v2) (pred_2 ?v6) (pred_3 ?v2))
       :effect (and  (pred_3 ?v6)
		     (not (pred_3 ?v2))))


   (:action op_3
       :parameters (?v8 ?v5)
       :precondition  (and  (pred_1 ?v8) (pred_2 ?v5)
			    (pred_5 ?v8 ?v5) (pred_3 ?v5) (pred_4))
       :effect (and (pred_6 ?v8)
		    (not (pred_5 ?v8 ?v5)) 
		    (not (pred_4))))

   (:action op_1
       :parameters  (?v8  ?v5)
       :precondition  (and  (pred_1 ?v8) (pred_2 ?v5)
			    (pred_6 ?v8) (pred_3 ?v5))
       :effect (and (pred_5 ?v8 ?v5)
		    (pred_4)
		    (not (pred_6 ?v8)))))
