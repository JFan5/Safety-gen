(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v1 ?v2)
		(pred_2 ?v7)
		(pred_5 ?v4)
		(pred_6 ?v4)
		(pred_1 ?v7 ?v4)
		(pred_4)
		(pred_3 ?v7))

   (:action op_2
       :parameters  (?v3 ?v6)
       :precondition (and (not-eq ?v3 ?v6) 
                          (pred_5 ?v3) (pred_5 ?v6) (pred_6 ?v3))
       :effect (and  (pred_6 ?v6)
		     (not (pred_6 ?v3))))


   (:action op_1
       :parameters (?v5 ?v8)
       :precondition  (and  (pred_2 ?v5) (pred_5 ?v8)
			    (pred_1 ?v5 ?v8) (pred_6 ?v8) (pred_4))
       :effect (and (pred_3 ?v5)
		    (not (pred_1 ?v5 ?v8)) 
		    (not (pred_4))))

   (:action op_3
       :parameters  (?v5  ?v8)
       :precondition  (and  (pred_2 ?v5) (pred_5 ?v8)
			    (pred_3 ?v5) (pred_6 ?v8))
       :effect (and (pred_1 ?v5 ?v8)
		    (pred_4)
		    (not (pred_3 ?v5)))))
