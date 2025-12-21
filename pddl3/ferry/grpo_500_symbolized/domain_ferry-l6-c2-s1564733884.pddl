(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v6 ?v1)
		(pred_1 ?v5)
		(pred_5 ?v4)
		(pred_2 ?v4)
		(pred_4 ?v5 ?v4)
		(pred_3)
		(pred_6 ?v5))

   (:action op_2
       :parameters  (?v3 ?v7)
       :precondition (and (not-eq ?v3 ?v7) 
                          (pred_5 ?v3) (pred_5 ?v7) (pred_2 ?v3))
       :effect (and  (pred_2 ?v7)
		     (not (pred_2 ?v3))))


   (:action op_3
       :parameters (?v2 ?v8)
       :precondition  (and  (pred_1 ?v2) (pred_5 ?v8)
			    (pred_4 ?v2 ?v8) (pred_2 ?v8) (pred_3))
       :effect (and (pred_6 ?v2)
		    (not (pred_4 ?v2 ?v8)) 
		    (not (pred_3))))

   (:action op_1
       :parameters  (?v2  ?v8)
       :precondition  (and  (pred_1 ?v2) (pred_5 ?v8)
			    (pred_6 ?v2) (pred_2 ?v8))
       :effect (and (pred_4 ?v2 ?v8)
		    (pred_3)
		    (not (pred_6 ?v2)))))
