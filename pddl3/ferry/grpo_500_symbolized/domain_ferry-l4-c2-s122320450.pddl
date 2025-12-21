(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v8 ?v1)
		(pred_5 ?v4)
		(pred_6 ?v6)
		(pred_1 ?v6)
		(pred_2 ?v4 ?v6)
		(pred_3)
		(pred_4 ?v4))

   (:action op_1
       :parameters  (?v2 ?v3)
       :precondition (and (not-eq ?v2 ?v3) 
                          (pred_6 ?v2) (pred_6 ?v3) (pred_1 ?v2))
       :effect (and  (pred_1 ?v3)
		     (not (pred_1 ?v2))))


   (:action op_2
       :parameters (?v5 ?v7)
       :precondition  (and  (pred_5 ?v5) (pred_6 ?v7)
			    (pred_2 ?v5 ?v7) (pred_1 ?v7) (pred_3))
       :effect (and (pred_4 ?v5)
		    (not (pred_2 ?v5 ?v7)) 
		    (not (pred_3))))

   (:action op_3
       :parameters  (?v5  ?v7)
       :precondition  (and  (pred_5 ?v5) (pred_6 ?v7)
			    (pred_4 ?v5) (pred_1 ?v7))
       :effect (and (pred_2 ?v5 ?v7)
		    (pred_3)
		    (not (pred_4 ?v5)))))
