(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v6 ?v7)
		(pred_6 ?v1)
		(pred_3 ?v8)
		(pred_5 ?v8)
		(pred_4 ?v1 ?v8)
		(pred_1)
		(pred_2 ?v1))

   (:action op_1
       :parameters  (?v4 ?v3)
       :precondition (and (not-eq ?v4 ?v3) 
                          (pred_3 ?v4) (pred_3 ?v3) (pred_5 ?v4))
       :effect (and  (pred_5 ?v3)
		     (not (pred_5 ?v4))))


   (:action op_2
       :parameters (?v5 ?v2)
       :precondition  (and  (pred_6 ?v5) (pred_3 ?v2)
			    (pred_4 ?v5 ?v2) (pred_5 ?v2) (pred_1))
       :effect (and (pred_2 ?v5)
		    (not (pred_4 ?v5 ?v2)) 
		    (not (pred_1))))

   (:action op_3
       :parameters  (?v5  ?v2)
       :precondition  (and  (pred_6 ?v5) (pred_3 ?v2)
			    (pred_2 ?v5) (pred_5 ?v2))
       :effect (and (pred_4 ?v5 ?v2)
		    (pred_1)
		    (not (pred_2 ?v5)))))
