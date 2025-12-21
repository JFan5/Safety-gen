(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v3 ?v8)
		(pred_6 ?v1)
		(pred_3 ?v2)
		(pred_4 ?v2)
		(pred_1 ?v1 ?v2)
		(pred_2)
		(pred_5 ?v1))

   (:action op_3
       :parameters  (?v4 ?v5)
       :precondition (and (not-eq ?v4 ?v5) 
                          (pred_3 ?v4) (pred_3 ?v5) (pred_4 ?v4))
       :effect (and  (pred_4 ?v5)
		     (not (pred_4 ?v4))))


   (:action op_2
       :parameters (?v7 ?v6)
       :precondition  (and  (pred_6 ?v7) (pred_3 ?v6)
			    (pred_1 ?v7 ?v6) (pred_4 ?v6) (pred_2))
       :effect (and (pred_5 ?v7)
		    (not (pred_1 ?v7 ?v6)) 
		    (not (pred_2))))

   (:action op_1
       :parameters  (?v7  ?v6)
       :precondition  (and  (pred_6 ?v7) (pred_3 ?v6)
			    (pred_5 ?v7) (pred_4 ?v6))
       :effect (and (pred_1 ?v7 ?v6)
		    (pred_2)
		    (not (pred_5 ?v7)))))
