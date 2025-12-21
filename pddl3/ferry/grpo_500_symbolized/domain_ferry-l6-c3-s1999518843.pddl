(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v1 ?v8)
		(pred_6 ?v3)
		(pred_2 ?v5)
		(pred_5 ?v5)
		(pred_1 ?v3 ?v5)
		(pred_3)
		(pred_4 ?v3))

   (:action op_1
       :parameters  (?v4 ?v6)
       :precondition (and (not-eq ?v4 ?v6) 
                          (pred_2 ?v4) (pred_2 ?v6) (pred_5 ?v4))
       :effect (and  (pred_5 ?v6)
		     (not (pred_5 ?v4))))


   (:action op_2
       :parameters (?v7 ?v2)
       :precondition  (and  (pred_6 ?v7) (pred_2 ?v2)
			    (pred_1 ?v7 ?v2) (pred_5 ?v2) (pred_3))
       :effect (and (pred_4 ?v7)
		    (not (pred_1 ?v7 ?v2)) 
		    (not (pred_3))))

   (:action op_3
       :parameters  (?v7  ?v2)
       :precondition  (and  (pred_6 ?v7) (pred_2 ?v2)
			    (pred_4 ?v7) (pred_5 ?v2))
       :effect (and (pred_1 ?v7 ?v2)
		    (pred_3)
		    (not (pred_4 ?v7)))))
