(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v6 ?v8)
		(pred_2 ?v7)
		(pred_3 ?v1)
		(pred_6 ?v1)
		(pred_1 ?v7 ?v1)
		(pred_5)
		(pred_4 ?v7))

   (:action op_1
       :parameters  (?v4 ?v2)
       :precondition (and (not-eq ?v4 ?v2) 
                          (pred_3 ?v4) (pred_3 ?v2) (pred_6 ?v4))
       :effect (and  (pred_6 ?v2)
		     (not (pred_6 ?v4))))


   (:action op_2
       :parameters (?v5 ?v3)
       :precondition  (and  (pred_2 ?v5) (pred_3 ?v3)
			    (pred_1 ?v5 ?v3) (pred_6 ?v3) (pred_5))
       :effect (and (pred_4 ?v5)
		    (not (pred_1 ?v5 ?v3)) 
		    (not (pred_5))))

   (:action op_3
       :parameters  (?v5  ?v3)
       :precondition  (and  (pred_2 ?v5) (pred_3 ?v3)
			    (pred_4 ?v5) (pred_6 ?v3))
       :effect (and (pred_1 ?v5 ?v3)
		    (pred_5)
		    (not (pred_4 ?v5)))))
