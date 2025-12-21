(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v4 ?v1)
		(pred_2 ?v8)
		(pred_6 ?v3)
		(pred_1 ?v3)
		(pred_3 ?v8 ?v3)
		(pred_4)
		(pred_5 ?v8))

   (:action op_1
       :parameters  (?v2 ?v5)
       :precondition (and (not-eq ?v2 ?v5) 
                          (pred_6 ?v2) (pred_6 ?v5) (pred_1 ?v2))
       :effect (and  (pred_1 ?v5)
		     (not (pred_1 ?v2))))


   (:action op_2
       :parameters (?v7 ?v6)
       :precondition  (and  (pred_2 ?v7) (pred_6 ?v6)
			    (pred_3 ?v7 ?v6) (pred_1 ?v6) (pred_4))
       :effect (and (pred_5 ?v7)
		    (not (pred_3 ?v7 ?v6)) 
		    (not (pred_4))))

   (:action op_3
       :parameters  (?v7  ?v6)
       :precondition  (and  (pred_2 ?v7) (pred_6 ?v6)
			    (pred_5 ?v7) (pred_1 ?v6))
       :effect (and (pred_3 ?v7 ?v6)
		    (pred_4)
		    (not (pred_5 ?v7)))))
