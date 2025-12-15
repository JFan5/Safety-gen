(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v1 ?v3)
		(pred_3 ?v4)
		(pred_6 ?v5)
		(pred_5 ?v5)
		(pred_2 ?v4 ?v5)
		(pred_4)
		(pred_1 ?v4))

   (:action op_2
       :parameters  (?v2 ?v6)
       :precondition (and (not-eq ?v2 ?v6) 
                          (pred_6 ?v2) (pred_6 ?v6) (pred_5 ?v2))
       :effect (and  (pred_5 ?v6)
		     (not (pred_5 ?v2))))


   (:action op_3
       :parameters (?v7 ?v8)
       :precondition  (and  (pred_3 ?v7) (pred_6 ?v8)
			    (pred_2 ?v7 ?v8) (pred_5 ?v8) (pred_4))
       :effect (and (pred_1 ?v7)
		    (not (pred_2 ?v7 ?v8)) 
		    (not (pred_4))))

   (:action op_1
       :parameters  (?v7  ?v8)
       :precondition  (and  (pred_3 ?v7) (pred_6 ?v8)
			    (pred_1 ?v7) (pred_5 ?v8))
       :effect (and (pred_2 ?v7 ?v8)
		    (pred_4)
		    (not (pred_1 ?v7)))))
