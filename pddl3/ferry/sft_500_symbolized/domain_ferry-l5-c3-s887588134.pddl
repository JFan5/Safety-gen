(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v8 ?v4)
		(pred_3 ?v7)
		(pred_5 ?v3)
		(pred_2 ?v3)
		(pred_6 ?v7 ?v3)
		(pred_4)
		(pred_1 ?v7))

   (:action op_2
       :parameters  (?v2 ?v6)
       :precondition (and (not-eq ?v2 ?v6) 
                          (pred_5 ?v2) (pred_5 ?v6) (pred_2 ?v2))
       :effect (and  (pred_2 ?v6)
		     (not (pred_2 ?v2))))


   (:action op_1
       :parameters (?v5 ?v1)
       :precondition  (and  (pred_3 ?v5) (pred_5 ?v1)
			    (pred_6 ?v5 ?v1) (pred_2 ?v1) (pred_4))
       :effect (and (pred_1 ?v5)
		    (not (pred_6 ?v5 ?v1)) 
		    (not (pred_4))))

   (:action op_3
       :parameters  (?v5  ?v1)
       :precondition  (and  (pred_3 ?v5) (pred_5 ?v1)
			    (pred_1 ?v5) (pred_2 ?v1))
       :effect (and (pred_6 ?v5 ?v1)
		    (pred_4)
		    (not (pred_1 ?v5)))))
