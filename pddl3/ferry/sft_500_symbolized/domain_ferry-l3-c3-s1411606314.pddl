(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v6 ?v8)
		(pred_3 ?v3)
		(pred_2 ?v1)
		(pred_1 ?v1)
		(pred_6 ?v3 ?v1)
		(pred_4)
		(pred_5 ?v3))

   (:action op_3
       :parameters  (?v4 ?v7)
       :precondition (and (not-eq ?v4 ?v7) 
                          (pred_2 ?v4) (pred_2 ?v7) (pred_1 ?v4))
       :effect (and  (pred_1 ?v7)
		     (not (pred_1 ?v4))))


   (:action op_2
       :parameters (?v2 ?v5)
       :precondition  (and  (pred_3 ?v2) (pred_2 ?v5)
			    (pred_6 ?v2 ?v5) (pred_1 ?v5) (pred_4))
       :effect (and (pred_5 ?v2)
		    (not (pred_6 ?v2 ?v5)) 
		    (not (pred_4))))

   (:action op_1
       :parameters  (?v2  ?v5)
       :precondition  (and  (pred_3 ?v2) (pred_2 ?v5)
			    (pred_5 ?v2) (pred_1 ?v5))
       :effect (and (pred_6 ?v2 ?v5)
		    (pred_4)
		    (not (pred_5 ?v2)))))
