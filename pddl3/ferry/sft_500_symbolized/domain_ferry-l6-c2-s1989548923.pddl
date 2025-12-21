(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v3 ?v1)
		(pred_6 ?v5)
		(pred_5 ?v2)
		(pred_1 ?v2)
		(pred_4 ?v5 ?v2)
		(pred_2)
		(pred_3 ?v5))

   (:action op_2
       :parameters  (?v4 ?v7)
       :precondition (and (not-eq ?v4 ?v7) 
                          (pred_5 ?v4) (pred_5 ?v7) (pred_1 ?v4))
       :effect (and  (pred_1 ?v7)
		     (not (pred_1 ?v4))))


   (:action op_1
       :parameters (?v6 ?v8)
       :precondition  (and  (pred_6 ?v6) (pred_5 ?v8)
			    (pred_4 ?v6 ?v8) (pred_1 ?v8) (pred_2))
       :effect (and (pred_3 ?v6)
		    (not (pred_4 ?v6 ?v8)) 
		    (not (pred_2))))

   (:action op_3
       :parameters  (?v6  ?v8)
       :precondition  (and  (pred_6 ?v6) (pred_5 ?v8)
			    (pred_3 ?v6) (pred_1 ?v8))
       :effect (and (pred_4 ?v6 ?v8)
		    (pred_2)
		    (not (pred_3 ?v6)))))
