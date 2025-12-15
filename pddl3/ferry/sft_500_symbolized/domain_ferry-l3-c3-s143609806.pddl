(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v6 ?v2)
		(pred_1 ?v7)
		(pred_5 ?v4)
		(pred_2 ?v4)
		(pred_6 ?v7 ?v4)
		(pred_4)
		(pred_3 ?v7))

   (:action op_1
       :parameters  (?v3 ?v1)
       :precondition (and (not-eq ?v3 ?v1) 
                          (pred_5 ?v3) (pred_5 ?v1) (pred_2 ?v3))
       :effect (and  (pred_2 ?v1)
		     (not (pred_2 ?v3))))


   (:action op_2
       :parameters (?v8 ?v5)
       :precondition  (and  (pred_1 ?v8) (pred_5 ?v5)
			    (pred_6 ?v8 ?v5) (pred_2 ?v5) (pred_4))
       :effect (and (pred_3 ?v8)
		    (not (pred_6 ?v8 ?v5)) 
		    (not (pred_4))))

   (:action op_3
       :parameters  (?v8  ?v5)
       :precondition  (and  (pred_1 ?v8) (pred_5 ?v5)
			    (pred_3 ?v8) (pred_2 ?v5))
       :effect (and (pred_6 ?v8 ?v5)
		    (pred_4)
		    (not (pred_3 ?v8)))))
