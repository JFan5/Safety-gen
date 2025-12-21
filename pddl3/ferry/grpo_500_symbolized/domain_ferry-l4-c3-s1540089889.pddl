(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v1 ?v7)
		(pred_5 ?v5)
		(pred_6 ?v4)
		(pred_1 ?v4)
		(pred_4 ?v5 ?v4)
		(pred_3)
		(pred_2 ?v5))

   (:action op_2
       :parameters  (?v3 ?v8)
       :precondition (and (not-eq ?v3 ?v8) 
                          (pred_6 ?v3) (pred_6 ?v8) (pred_1 ?v3))
       :effect (and  (pred_1 ?v8)
		     (not (pred_1 ?v3))))


   (:action op_3
       :parameters (?v2 ?v6)
       :precondition  (and  (pred_5 ?v2) (pred_6 ?v6)
			    (pred_4 ?v2 ?v6) (pred_1 ?v6) (pred_3))
       :effect (and (pred_2 ?v2)
		    (not (pred_4 ?v2 ?v6)) 
		    (not (pred_3))))

   (:action op_1
       :parameters  (?v2  ?v6)
       :precondition  (and  (pred_5 ?v2) (pred_6 ?v6)
			    (pred_2 ?v2) (pred_1 ?v6))
       :effect (and (pred_4 ?v2 ?v6)
		    (pred_3)
		    (not (pred_2 ?v2)))))
