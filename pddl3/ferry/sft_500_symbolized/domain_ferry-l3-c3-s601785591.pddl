(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v3 ?v1)
		(pred_5 ?v8)
		(pred_1 ?v5)
		(pred_6 ?v5)
		(pred_2 ?v8 ?v5)
		(pred_3)
		(pred_4 ?v8))

   (:action op_1
       :parameters  (?v4 ?v2)
       :precondition (and (not-eq ?v4 ?v2) 
                          (pred_1 ?v4) (pred_1 ?v2) (pred_6 ?v4))
       :effect (and  (pred_6 ?v2)
		     (not (pred_6 ?v4))))


   (:action op_3
       :parameters (?v7 ?v6)
       :precondition  (and  (pred_5 ?v7) (pred_1 ?v6)
			    (pred_2 ?v7 ?v6) (pred_6 ?v6) (pred_3))
       :effect (and (pred_4 ?v7)
		    (not (pred_2 ?v7 ?v6)) 
		    (not (pred_3))))

   (:action op_2
       :parameters  (?v7  ?v6)
       :precondition  (and  (pred_5 ?v7) (pred_1 ?v6)
			    (pred_4 ?v7) (pred_6 ?v6))
       :effect (and (pred_2 ?v7 ?v6)
		    (pred_3)
		    (not (pred_4 ?v7)))))
