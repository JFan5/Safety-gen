(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v2 ?v6)
		(pred_3 ?v7)
		(pred_1 ?v8)
		(pred_5 ?v8)
		(pred_2 ?v7 ?v8)
		(pred_4)
		(pred_6 ?v7))

   (:action op_3
       :parameters  (?v4 ?v3)
       :precondition (and (not-eq ?v4 ?v3) 
                          (pred_1 ?v4) (pred_1 ?v3) (pred_5 ?v4))
       :effect (and  (pred_5 ?v3)
		     (not (pred_5 ?v4))))


   (:action op_1
       :parameters (?v1 ?v5)
       :precondition  (and  (pred_3 ?v1) (pred_1 ?v5)
			    (pred_2 ?v1 ?v5) (pred_5 ?v5) (pred_4))
       :effect (and (pred_6 ?v1)
		    (not (pred_2 ?v1 ?v5)) 
		    (not (pred_4))))

   (:action op_2
       :parameters  (?v1  ?v5)
       :precondition  (and  (pred_3 ?v1) (pred_1 ?v5)
			    (pred_6 ?v1) (pred_5 ?v5))
       :effect (and (pred_2 ?v1 ?v5)
		    (pred_4)
		    (not (pred_6 ?v1)))))
