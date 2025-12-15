(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v7 ?v5)
		(pred_2 ?v1)
		(pred_1 ?v3)
		(pred_6 ?v3)
		(pred_5 ?v1 ?v3)
		(pred_4)
		(pred_3 ?v1))

   (:action op_1
       :parameters  (?v2 ?v6)
       :precondition (and (not-eq ?v2 ?v6) 
                          (pred_1 ?v2) (pred_1 ?v6) (pred_6 ?v2))
       :effect (and  (pred_6 ?v6)
		     (not (pred_6 ?v2))))


   (:action op_3
       :parameters (?v8 ?v4)
       :precondition  (and  (pred_2 ?v8) (pred_1 ?v4)
			    (pred_5 ?v8 ?v4) (pred_6 ?v4) (pred_4))
       :effect (and (pred_3 ?v8)
		    (not (pred_5 ?v8 ?v4)) 
		    (not (pred_4))))

   (:action op_2
       :parameters  (?v8  ?v4)
       :precondition  (and  (pred_2 ?v8) (pred_1 ?v4)
			    (pred_3 ?v8) (pred_6 ?v4))
       :effect (and (pred_5 ?v8 ?v4)
		    (pred_4)
		    (not (pred_3 ?v8)))))
