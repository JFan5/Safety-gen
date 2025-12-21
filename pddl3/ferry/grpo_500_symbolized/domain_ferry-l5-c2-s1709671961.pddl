(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v6 ?v7)
		(pred_3 ?v8)
		(pred_6 ?v1)
		(pred_1 ?v1)
		(pred_5 ?v8 ?v1)
		(pred_2)
		(pred_4 ?v8))

   (:action op_2
       :parameters  (?v3 ?v5)
       :precondition (and (not-eq ?v3 ?v5) 
                          (pred_6 ?v3) (pred_6 ?v5) (pred_1 ?v3))
       :effect (and  (pred_1 ?v5)
		     (not (pred_1 ?v3))))


   (:action op_1
       :parameters (?v4 ?v2)
       :precondition  (and  (pred_3 ?v4) (pred_6 ?v2)
			    (pred_5 ?v4 ?v2) (pred_1 ?v2) (pred_2))
       :effect (and (pred_4 ?v4)
		    (not (pred_5 ?v4 ?v2)) 
		    (not (pred_2))))

   (:action op_3
       :parameters  (?v4  ?v2)
       :precondition  (and  (pred_3 ?v4) (pred_6 ?v2)
			    (pred_4 ?v4) (pred_1 ?v2))
       :effect (and (pred_5 ?v4 ?v2)
		    (pred_2)
		    (not (pred_4 ?v4)))))
