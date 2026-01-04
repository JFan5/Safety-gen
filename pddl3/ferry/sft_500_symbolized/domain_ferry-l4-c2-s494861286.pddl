(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v6 ?v8)
		(pred_5 ?v2)
		(pred_3 ?v4)
		(pred_6 ?v4)
		(pred_2 ?v2 ?v4)
		(pred_1)
		(pred_4 ?v2))

   (:action op_3
       :parameters  (?v3 ?v7)
       :precondition (and (not-eq ?v3 ?v7) 
                          (pred_3 ?v3) (pred_3 ?v7) (pred_6 ?v3))
       :effect (and  (pred_6 ?v7)
		     (not (pred_6 ?v3))))


   (:action op_1
       :parameters (?v1 ?v5)
       :precondition  (and  (pred_5 ?v1) (pred_3 ?v5)
			    (pred_2 ?v1 ?v5) (pred_6 ?v5) (pred_1))
       :effect (and (pred_4 ?v1)
		    (not (pred_2 ?v1 ?v5)) 
		    (not (pred_1))))

   (:action op_2
       :parameters  (?v1  ?v5)
       :precondition  (and  (pred_5 ?v1) (pred_3 ?v5)
			    (pred_4 ?v1) (pred_6 ?v5))
       :effect (and (pred_2 ?v1 ?v5)
		    (pred_1)
		    (not (pred_4 ?v1)))))
