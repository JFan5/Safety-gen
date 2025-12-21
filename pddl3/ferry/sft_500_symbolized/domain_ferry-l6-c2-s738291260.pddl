(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v3 ?v5)
		(pred_1 ?v6)
		(pred_6 ?v1)
		(pred_2 ?v1)
		(pred_5 ?v6 ?v1)
		(pred_3)
		(pred_4 ?v6))

   (:action op_2
       :parameters  (?v2 ?v8)
       :precondition (and (not-eq ?v2 ?v8) 
                          (pred_6 ?v2) (pred_6 ?v8) (pred_2 ?v2))
       :effect (and  (pred_2 ?v8)
		     (not (pred_2 ?v2))))


   (:action op_1
       :parameters (?v7 ?v4)
       :precondition  (and  (pred_1 ?v7) (pred_6 ?v4)
			    (pred_5 ?v7 ?v4) (pred_2 ?v4) (pred_3))
       :effect (and (pred_4 ?v7)
		    (not (pred_5 ?v7 ?v4)) 
		    (not (pred_3))))

   (:action op_3
       :parameters  (?v7  ?v4)
       :precondition  (and  (pred_1 ?v7) (pred_6 ?v4)
			    (pred_4 ?v7) (pred_2 ?v4))
       :effect (and (pred_5 ?v7 ?v4)
		    (pred_3)
		    (not (pred_4 ?v7)))))
