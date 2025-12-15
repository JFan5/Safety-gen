(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v6 ?v1)
		(pred_3 ?v8)
		(pred_5 ?v5)
		(pred_6 ?v5)
		(pred_1 ?v8 ?v5)
		(pred_2)
		(pred_4 ?v8))

   (:action op_2
       :parameters  (?v2 ?v7)
       :precondition (and (not-eq ?v2 ?v7) 
                          (pred_5 ?v2) (pred_5 ?v7) (pred_6 ?v2))
       :effect (and  (pred_6 ?v7)
		     (not (pred_6 ?v2))))


   (:action op_1
       :parameters (?v3 ?v4)
       :precondition  (and  (pred_3 ?v3) (pred_5 ?v4)
			    (pred_1 ?v3 ?v4) (pred_6 ?v4) (pred_2))
       :effect (and (pred_4 ?v3)
		    (not (pred_1 ?v3 ?v4)) 
		    (not (pred_2))))

   (:action op_3
       :parameters  (?v3  ?v4)
       :precondition  (and  (pred_3 ?v3) (pred_5 ?v4)
			    (pred_4 ?v3) (pred_6 ?v4))
       :effect (and (pred_1 ?v3 ?v4)
		    (pred_2)
		    (not (pred_4 ?v3)))))
