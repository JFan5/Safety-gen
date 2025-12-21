(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v1 ?v3)
		(pred_6 ?v7)
		(pred_3 ?v4)
		(pred_1 ?v4)
		(pred_5 ?v7 ?v4)
		(pred_2)
		(pred_4 ?v7))

   (:action op_2
       :parameters  (?v2 ?v6)
       :precondition (and (not-eq ?v2 ?v6) 
                          (pred_3 ?v2) (pred_3 ?v6) (pred_1 ?v2))
       :effect (and  (pred_1 ?v6)
		     (not (pred_1 ?v2))))


   (:action op_3
       :parameters (?v5 ?v8)
       :precondition  (and  (pred_6 ?v5) (pred_3 ?v8)
			    (pred_5 ?v5 ?v8) (pred_1 ?v8) (pred_2))
       :effect (and (pred_4 ?v5)
		    (not (pred_5 ?v5 ?v8)) 
		    (not (pred_2))))

   (:action op_1
       :parameters  (?v5  ?v8)
       :precondition  (and  (pred_6 ?v5) (pred_3 ?v8)
			    (pred_4 ?v5) (pred_1 ?v8))
       :effect (and (pred_5 ?v5 ?v8)
		    (pred_2)
		    (not (pred_4 ?v5)))))
