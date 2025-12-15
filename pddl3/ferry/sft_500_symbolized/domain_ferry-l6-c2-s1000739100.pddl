(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v2 ?v7)
		(pred_4 ?v4)
		(pred_1 ?v6)
		(pred_3 ?v6)
		(pred_5 ?v4 ?v6)
		(pred_2)
		(pred_6 ?v4))

   (:action op_2
       :parameters  (?v3 ?v1)
       :precondition (and (not-eq ?v3 ?v1) 
                          (pred_1 ?v3) (pred_1 ?v1) (pred_3 ?v3))
       :effect (and  (pred_3 ?v1)
		     (not (pred_3 ?v3))))


   (:action op_1
       :parameters (?v8 ?v5)
       :precondition  (and  (pred_4 ?v8) (pred_1 ?v5)
			    (pred_5 ?v8 ?v5) (pred_3 ?v5) (pred_2))
       :effect (and (pred_6 ?v8)
		    (not (pred_5 ?v8 ?v5)) 
		    (not (pred_2))))

   (:action op_3
       :parameters  (?v8  ?v5)
       :precondition  (and  (pred_4 ?v8) (pred_1 ?v5)
			    (pred_6 ?v8) (pred_3 ?v5))
       :effect (and (pred_5 ?v8 ?v5)
		    (pred_2)
		    (not (pred_6 ?v8)))))
