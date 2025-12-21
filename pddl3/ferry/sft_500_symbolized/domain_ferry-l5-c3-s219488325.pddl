(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v6 ?v4)
		(pred_6 ?v7)
		(pred_5 ?v1)
		(pred_2 ?v1)
		(pred_1 ?v7 ?v1)
		(pred_3)
		(pred_4 ?v7))

   (:action op_3
       :parameters  (?v2 ?v5)
       :precondition (and (not-eq ?v2 ?v5) 
                          (pred_5 ?v2) (pred_5 ?v5) (pred_2 ?v2))
       :effect (and  (pred_2 ?v5)
		     (not (pred_2 ?v2))))


   (:action op_2
       :parameters (?v8 ?v3)
       :precondition  (and  (pred_6 ?v8) (pred_5 ?v3)
			    (pred_1 ?v8 ?v3) (pred_2 ?v3) (pred_3))
       :effect (and (pred_4 ?v8)
		    (not (pred_1 ?v8 ?v3)) 
		    (not (pred_3))))

   (:action op_1
       :parameters  (?v8  ?v3)
       :precondition  (and  (pred_6 ?v8) (pred_5 ?v3)
			    (pred_4 ?v8) (pred_2 ?v3))
       :effect (and (pred_1 ?v8 ?v3)
		    (pred_3)
		    (not (pred_4 ?v8)))))
