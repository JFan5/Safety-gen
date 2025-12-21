(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v3 ?v8)
		(pred_5 ?v2)
		(pred_4 ?v1)
		(pred_1 ?v1)
		(pred_6 ?v2 ?v1)
		(pred_3)
		(pred_2 ?v2))

   (:action op_3
       :parameters  (?v4 ?v6)
       :precondition (and (not-eq ?v4 ?v6) 
                          (pred_4 ?v4) (pred_4 ?v6) (pred_1 ?v4))
       :effect (and  (pred_1 ?v6)
		     (not (pred_1 ?v4))))


   (:action op_2
       :parameters (?v5 ?v7)
       :precondition  (and  (pred_5 ?v5) (pred_4 ?v7)
			    (pred_6 ?v5 ?v7) (pred_1 ?v7) (pred_3))
       :effect (and (pred_2 ?v5)
		    (not (pred_6 ?v5 ?v7)) 
		    (not (pred_3))))

   (:action op_1
       :parameters  (?v5  ?v7)
       :precondition  (and  (pred_5 ?v5) (pred_4 ?v7)
			    (pred_2 ?v5) (pred_1 ?v7))
       :effect (and (pred_6 ?v5 ?v7)
		    (pred_3)
		    (not (pred_2 ?v5)))))
