(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v1 ?v8)
		(pred_6 ?v4)
		(pred_4 ?v3)
		(pred_1 ?v3)
		(pred_3 ?v4 ?v3)
		(pred_2)
		(pred_5 ?v4))

   (:action op_2
       :parameters  (?v2 ?v6)
       :precondition (and (not-eq ?v2 ?v6) 
                          (pred_4 ?v2) (pred_4 ?v6) (pred_1 ?v2))
       :effect (and  (pred_1 ?v6)
		     (not (pred_1 ?v2))))


   (:action op_1
       :parameters (?v5 ?v7)
       :precondition  (and  (pred_6 ?v5) (pred_4 ?v7)
			    (pred_3 ?v5 ?v7) (pred_1 ?v7) (pred_2))
       :effect (and (pred_5 ?v5)
		    (not (pred_3 ?v5 ?v7)) 
		    (not (pred_2))))

   (:action op_3
       :parameters  (?v5  ?v7)
       :precondition  (and  (pred_6 ?v5) (pred_4 ?v7)
			    (pred_5 ?v5) (pred_1 ?v7))
       :effect (and (pred_3 ?v5 ?v7)
		    (pred_2)
		    (not (pred_5 ?v5)))))
