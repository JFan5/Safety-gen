(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v8 ?v1)
		(pred_2 ?v5)
		(pred_5 ?v6)
		(pred_3 ?v6)
		(pred_1 ?v5 ?v6)
		(pred_4)
		(pred_6 ?v5))

   (:action op_1
       :parameters  (?v3 ?v4)
       :precondition (and (not-eq ?v3 ?v4) 
                          (pred_5 ?v3) (pred_5 ?v4) (pred_3 ?v3))
       :effect (and  (pred_3 ?v4)
		     (not (pred_3 ?v3))))


   (:action op_3
       :parameters (?v7 ?v2)
       :precondition  (and  (pred_2 ?v7) (pred_5 ?v2)
			    (pred_1 ?v7 ?v2) (pred_3 ?v2) (pred_4))
       :effect (and (pred_6 ?v7)
		    (not (pred_1 ?v7 ?v2)) 
		    (not (pred_4))))

   (:action op_2
       :parameters  (?v7  ?v2)
       :precondition  (and  (pred_2 ?v7) (pred_5 ?v2)
			    (pred_6 ?v7) (pred_3 ?v2))
       :effect (and (pred_1 ?v7 ?v2)
		    (pred_4)
		    (not (pred_6 ?v7)))))
