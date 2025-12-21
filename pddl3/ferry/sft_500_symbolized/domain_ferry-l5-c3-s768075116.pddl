(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v3 ?v1)
		(pred_5 ?v7)
		(pred_6 ?v6)
		(pred_4 ?v6)
		(pred_2 ?v7 ?v6)
		(pred_1)
		(pred_3 ?v7))

   (:action op_1
       :parameters  (?v2 ?v5)
       :precondition (and (not-eq ?v2 ?v5) 
                          (pred_6 ?v2) (pred_6 ?v5) (pred_4 ?v2))
       :effect (and  (pred_4 ?v5)
		     (not (pred_4 ?v2))))


   (:action op_2
       :parameters (?v4 ?v8)
       :precondition  (and  (pred_5 ?v4) (pred_6 ?v8)
			    (pred_2 ?v4 ?v8) (pred_4 ?v8) (pred_1))
       :effect (and (pred_3 ?v4)
		    (not (pred_2 ?v4 ?v8)) 
		    (not (pred_1))))

   (:action op_3
       :parameters  (?v4  ?v8)
       :precondition  (and  (pred_5 ?v4) (pred_6 ?v8)
			    (pred_3 ?v4) (pred_4 ?v8))
       :effect (and (pred_2 ?v4 ?v8)
		    (pred_1)
		    (not (pred_3 ?v4)))))
