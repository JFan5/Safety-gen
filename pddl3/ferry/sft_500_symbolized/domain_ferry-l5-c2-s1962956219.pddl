(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v6 ?v8)
		(pred_3 ?v3)
		(pred_2 ?v7)
		(pred_5 ?v7)
		(pred_6 ?v3 ?v7)
		(pred_4)
		(pred_1 ?v3))

   (:action op_1
       :parameters  (?v4 ?v2)
       :precondition (and (not-eq ?v4 ?v2) 
                          (pred_2 ?v4) (pred_2 ?v2) (pred_5 ?v4))
       :effect (and  (pred_5 ?v2)
		     (not (pred_5 ?v4))))


   (:action op_2
       :parameters (?v1 ?v5)
       :precondition  (and  (pred_3 ?v1) (pred_2 ?v5)
			    (pred_6 ?v1 ?v5) (pred_5 ?v5) (pred_4))
       :effect (and (pred_1 ?v1)
		    (not (pred_6 ?v1 ?v5)) 
		    (not (pred_4))))

   (:action op_3
       :parameters  (?v1  ?v5)
       :precondition  (and  (pred_3 ?v1) (pred_2 ?v5)
			    (pred_1 ?v1) (pred_5 ?v5))
       :effect (and (pred_6 ?v1 ?v5)
		    (pred_4)
		    (not (pred_1 ?v1)))))
