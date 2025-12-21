(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v8 ?v6)
		(pred_5 ?v3)
		(pred_1 ?v5)
		(pred_2 ?v5)
		(pred_4 ?v3 ?v5)
		(pred_3)
		(pred_6 ?v3))

   (:action op_3
       :parameters  (?v2 ?v4)
       :precondition (and (not-eq ?v2 ?v4) 
                          (pred_1 ?v2) (pred_1 ?v4) (pred_2 ?v2))
       :effect (and  (pred_2 ?v4)
		     (not (pred_2 ?v2))))


   (:action op_1
       :parameters (?v7 ?v1)
       :precondition  (and  (pred_5 ?v7) (pred_1 ?v1)
			    (pred_4 ?v7 ?v1) (pred_2 ?v1) (pred_3))
       :effect (and (pred_6 ?v7)
		    (not (pred_4 ?v7 ?v1)) 
		    (not (pred_3))))

   (:action op_2
       :parameters  (?v7  ?v1)
       :precondition  (and  (pred_5 ?v7) (pred_1 ?v1)
			    (pred_6 ?v7) (pred_2 ?v1))
       :effect (and (pred_4 ?v7 ?v1)
		    (pred_3)
		    (not (pred_6 ?v7)))))
