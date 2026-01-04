(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v6 ?v4)
		(pred_2 ?v8)
		(pred_1 ?v7)
		(pred_6 ?v7)
		(pred_4 ?v8 ?v7)
		(pred_3)
		(pred_5 ?v8))

   (:action op_1
       :parameters  (?v3 ?v2)
       :precondition (and (not-eq ?v3 ?v2) 
                          (pred_1 ?v3) (pred_1 ?v2) (pred_6 ?v3))
       :effect (and  (pred_6 ?v2)
		     (not (pred_6 ?v3))))


   (:action op_3
       :parameters (?v1 ?v5)
       :precondition  (and  (pred_2 ?v1) (pred_1 ?v5)
			    (pred_4 ?v1 ?v5) (pred_6 ?v5) (pred_3))
       :effect (and (pred_5 ?v1)
		    (not (pred_4 ?v1 ?v5)) 
		    (not (pred_3))))

   (:action op_2
       :parameters  (?v1  ?v5)
       :precondition  (and  (pred_2 ?v1) (pred_1 ?v5)
			    (pred_5 ?v1) (pred_6 ?v5))
       :effect (and (pred_4 ?v1 ?v5)
		    (pred_3)
		    (not (pred_5 ?v1)))))
