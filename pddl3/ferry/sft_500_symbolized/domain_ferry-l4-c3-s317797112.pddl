(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v7 ?v5)
		(pred_1 ?v1)
		(pred_5 ?v6)
		(pred_4 ?v6)
		(pred_6 ?v1 ?v6)
		(pred_3)
		(pred_2 ?v1))

   (:action op_1
       :parameters  (?v2 ?v4)
       :precondition (and (not-eq ?v2 ?v4) 
                          (pred_5 ?v2) (pred_5 ?v4) (pred_4 ?v2))
       :effect (and  (pred_4 ?v4)
		     (not (pred_4 ?v2))))


   (:action op_2
       :parameters (?v3 ?v8)
       :precondition  (and  (pred_1 ?v3) (pred_5 ?v8)
			    (pred_6 ?v3 ?v8) (pred_4 ?v8) (pred_3))
       :effect (and (pred_2 ?v3)
		    (not (pred_6 ?v3 ?v8)) 
		    (not (pred_3))))

   (:action op_3
       :parameters  (?v3  ?v8)
       :precondition  (and  (pred_1 ?v3) (pred_5 ?v8)
			    (pred_2 ?v3) (pred_4 ?v8))
       :effect (and (pred_6 ?v3 ?v8)
		    (pred_3)
		    (not (pred_2 ?v3)))))
