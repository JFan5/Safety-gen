(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v2 ?v7)
		(pred_2 ?v1)
		(pred_5 ?v6)
		(pred_1 ?v6)
		(pred_6 ?v1 ?v6)
		(pred_4)
		(pred_3 ?v1))

   (:action op_2
       :parameters  (?v3 ?v4)
       :precondition (and (not-eq ?v3 ?v4) 
                          (pred_5 ?v3) (pred_5 ?v4) (pred_1 ?v3))
       :effect (and  (pred_1 ?v4)
		     (not (pred_1 ?v3))))


   (:action op_1
       :parameters (?v8 ?v5)
       :precondition  (and  (pred_2 ?v8) (pred_5 ?v5)
			    (pred_6 ?v8 ?v5) (pred_1 ?v5) (pred_4))
       :effect (and (pred_3 ?v8)
		    (not (pred_6 ?v8 ?v5)) 
		    (not (pred_4))))

   (:action op_3
       :parameters  (?v8  ?v5)
       :precondition  (and  (pred_2 ?v8) (pred_5 ?v5)
			    (pred_3 ?v8) (pred_1 ?v5))
       :effect (and (pred_6 ?v8 ?v5)
		    (pred_4)
		    (not (pred_3 ?v8)))))
