(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v1 ?v8)
		(pred_6 ?v2)
		(pred_1 ?v6)
		(pred_5 ?v6)
		(pred_4 ?v2 ?v6)
		(pred_3)
		(pred_2 ?v2))

   (:action op_3
       :parameters  (?v7 ?v4)
       :precondition (and (not-eq ?v7 ?v4) 
                          (pred_1 ?v7) (pred_1 ?v4) (pred_5 ?v7))
       :effect (and  (pred_5 ?v4)
		     (not (pred_5 ?v7))))


   (:action op_1
       :parameters (?v3 ?v5)
       :precondition  (and  (pred_6 ?v3) (pred_1 ?v5)
			    (pred_4 ?v3 ?v5) (pred_5 ?v5) (pred_3))
       :effect (and (pred_2 ?v3)
		    (not (pred_4 ?v3 ?v5)) 
		    (not (pred_3))))

   (:action op_2
       :parameters  (?v3  ?v5)
       :precondition  (and  (pred_6 ?v3) (pred_1 ?v5)
			    (pred_2 ?v3) (pred_5 ?v5))
       :effect (and (pred_4 ?v3 ?v5)
		    (pred_3)
		    (not (pred_2 ?v3)))))
