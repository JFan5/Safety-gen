(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v7 ?v4)
		(pred_2 ?v1)
		(pred_4 ?v6)
		(pred_5 ?v6)
		(pred_1 ?v1 ?v6)
		(pred_3)
		(pred_6 ?v1))

   (:action op_3
       :parameters  (?v3 ?v2)
       :precondition (and (not-eq ?v3 ?v2) 
                          (pred_4 ?v3) (pred_4 ?v2) (pred_5 ?v3))
       :effect (and  (pred_5 ?v2)
		     (not (pred_5 ?v3))))


   (:action op_2
       :parameters (?v8 ?v5)
       :precondition  (and  (pred_2 ?v8) (pred_4 ?v5)
			    (pred_1 ?v8 ?v5) (pred_5 ?v5) (pred_3))
       :effect (and (pred_6 ?v8)
		    (not (pred_1 ?v8 ?v5)) 
		    (not (pred_3))))

   (:action op_1
       :parameters  (?v8  ?v5)
       :precondition  (and  (pred_2 ?v8) (pred_4 ?v5)
			    (pred_6 ?v8) (pred_5 ?v5))
       :effect (and (pred_1 ?v8 ?v5)
		    (pred_3)
		    (not (pred_6 ?v8)))))
