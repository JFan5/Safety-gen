(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v6 ?v1)
		(pred_6 ?v5)
		(pred_1 ?v7)
		(pred_2 ?v7)
		(pred_5 ?v5 ?v7)
		(pred_3)
		(pred_4 ?v5))

   (:action op_2
       :parameters  (?v2 ?v4)
       :precondition (and (not-eq ?v2 ?v4) 
                          (pred_1 ?v2) (pred_1 ?v4) (pred_2 ?v2))
       :effect (and  (pred_2 ?v4)
		     (not (pred_2 ?v2))))


   (:action op_3
       :parameters (?v3 ?v8)
       :precondition  (and  (pred_6 ?v3) (pred_1 ?v8)
			    (pred_5 ?v3 ?v8) (pred_2 ?v8) (pred_3))
       :effect (and (pred_4 ?v3)
		    (not (pred_5 ?v3 ?v8)) 
		    (not (pred_3))))

   (:action op_1
       :parameters  (?v3  ?v8)
       :precondition  (and  (pred_6 ?v3) (pred_1 ?v8)
			    (pred_4 ?v3) (pred_2 ?v8))
       :effect (and (pred_5 ?v3 ?v8)
		    (pred_3)
		    (not (pred_4 ?v3)))))
