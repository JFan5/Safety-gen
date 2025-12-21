(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v7 ?v8)
		(pred_5 ?v2)
		(pred_4 ?v1)
		(pred_1 ?v1)
		(pred_3 ?v2 ?v1)
		(pred_2)
		(pred_6 ?v2))

   (:action op_3
       :parameters  (?v4 ?v5)
       :precondition (and (not-eq ?v4 ?v5) 
                          (pred_4 ?v4) (pred_4 ?v5) (pred_1 ?v4))
       :effect (and  (pred_1 ?v5)
		     (not (pred_1 ?v4))))


   (:action op_2
       :parameters (?v6 ?v3)
       :precondition  (and  (pred_5 ?v6) (pred_4 ?v3)
			    (pred_3 ?v6 ?v3) (pred_1 ?v3) (pred_2))
       :effect (and (pred_6 ?v6)
		    (not (pred_3 ?v6 ?v3)) 
		    (not (pred_2))))

   (:action op_1
       :parameters  (?v6  ?v3)
       :precondition  (and  (pred_5 ?v6) (pred_4 ?v3)
			    (pred_6 ?v6) (pred_1 ?v3))
       :effect (and (pred_3 ?v6 ?v3)
		    (pred_2)
		    (not (pred_6 ?v6)))))
