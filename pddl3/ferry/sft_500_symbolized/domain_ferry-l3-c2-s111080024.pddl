(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v1 ?v7)
		(pred_5 ?v5)
		(pred_3 ?v6)
		(pred_4 ?v6)
		(pred_1 ?v5 ?v6)
		(pred_2)
		(pred_6 ?v5))

   (:action op_2
       :parameters  (?v2 ?v3)
       :precondition (and (not-eq ?v2 ?v3) 
                          (pred_3 ?v2) (pred_3 ?v3) (pred_4 ?v2))
       :effect (and  (pred_4 ?v3)
		     (not (pred_4 ?v2))))


   (:action op_3
       :parameters (?v8 ?v4)
       :precondition  (and  (pred_5 ?v8) (pred_3 ?v4)
			    (pred_1 ?v8 ?v4) (pred_4 ?v4) (pred_2))
       :effect (and (pred_6 ?v8)
		    (not (pred_1 ?v8 ?v4)) 
		    (not (pred_2))))

   (:action op_1
       :parameters  (?v8  ?v4)
       :precondition  (and  (pred_5 ?v8) (pred_3 ?v4)
			    (pred_6 ?v8) (pred_4 ?v4))
       :effect (and (pred_1 ?v8 ?v4)
		    (pred_2)
		    (not (pred_6 ?v8)))))
