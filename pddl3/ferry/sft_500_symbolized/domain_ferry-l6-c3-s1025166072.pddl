(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v6 ?v5)
		(pred_3 ?v3)
		(pred_6 ?v1)
		(pred_5 ?v1)
		(pred_2 ?v3 ?v1)
		(pred_4)
		(pred_1 ?v3))

   (:action op_3
       :parameters  (?v2 ?v8)
       :precondition (and (not-eq ?v2 ?v8) 
                          (pred_6 ?v2) (pred_6 ?v8) (pred_5 ?v2))
       :effect (and  (pred_5 ?v8)
		     (not (pred_5 ?v2))))


   (:action op_1
       :parameters (?v7 ?v4)
       :precondition  (and  (pred_3 ?v7) (pred_6 ?v4)
			    (pred_2 ?v7 ?v4) (pred_5 ?v4) (pred_4))
       :effect (and (pred_1 ?v7)
		    (not (pred_2 ?v7 ?v4)) 
		    (not (pred_4))))

   (:action op_2
       :parameters  (?v7  ?v4)
       :precondition  (and  (pred_3 ?v7) (pred_6 ?v4)
			    (pred_1 ?v7) (pred_5 ?v4))
       :effect (and (pred_2 ?v7 ?v4)
		    (pred_4)
		    (not (pred_1 ?v7)))))
