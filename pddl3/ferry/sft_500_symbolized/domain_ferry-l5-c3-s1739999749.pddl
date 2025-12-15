(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v1 ?v7)
		(pred_3 ?v4)
		(pred_2 ?v5)
		(pred_4 ?v5)
		(pred_5 ?v4 ?v5)
		(pred_1)
		(pred_6 ?v4))

   (:action op_1
       :parameters  (?v2 ?v6)
       :precondition (and (not-eq ?v2 ?v6) 
                          (pred_2 ?v2) (pred_2 ?v6) (pred_4 ?v2))
       :effect (and  (pred_4 ?v6)
		     (not (pred_4 ?v2))))


   (:action op_3
       :parameters (?v3 ?v8)
       :precondition  (and  (pred_3 ?v3) (pred_2 ?v8)
			    (pred_5 ?v3 ?v8) (pred_4 ?v8) (pred_1))
       :effect (and (pred_6 ?v3)
		    (not (pred_5 ?v3 ?v8)) 
		    (not (pred_1))))

   (:action op_2
       :parameters  (?v3  ?v8)
       :precondition  (and  (pred_3 ?v3) (pred_2 ?v8)
			    (pred_6 ?v3) (pred_4 ?v8))
       :effect (and (pred_5 ?v3 ?v8)
		    (pred_1)
		    (not (pred_6 ?v3)))))
