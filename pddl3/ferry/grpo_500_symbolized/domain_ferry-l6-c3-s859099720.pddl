(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v1 ?v4)
		(pred_6 ?v2)
		(pred_2 ?v6)
		(pred_5 ?v6)
		(pred_1 ?v2 ?v6)
		(pred_3)
		(pred_4 ?v2))

   (:action op_2
       :parameters  (?v3 ?v8)
       :precondition (and (not-eq ?v3 ?v8) 
                          (pred_2 ?v3) (pred_2 ?v8) (pred_5 ?v3))
       :effect (and  (pred_5 ?v8)
		     (not (pred_5 ?v3))))


   (:action op_1
       :parameters (?v7 ?v5)
       :precondition  (and  (pred_6 ?v7) (pred_2 ?v5)
			    (pred_1 ?v7 ?v5) (pred_5 ?v5) (pred_3))
       :effect (and (pred_4 ?v7)
		    (not (pred_1 ?v7 ?v5)) 
		    (not (pred_3))))

   (:action op_3
       :parameters  (?v7  ?v5)
       :precondition  (and  (pred_6 ?v7) (pred_2 ?v5)
			    (pred_4 ?v7) (pred_5 ?v5))
       :effect (and (pred_1 ?v7 ?v5)
		    (pred_3)
		    (not (pred_4 ?v7)))))
