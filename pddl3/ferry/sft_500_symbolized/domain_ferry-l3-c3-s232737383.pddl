(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v4 ?v1)
		(pred_5 ?v6)
		(pred_2 ?v7)
		(pred_6 ?v7)
		(pred_1 ?v6 ?v7)
		(pred_3)
		(pred_4 ?v6))

   (:action op_3
       :parameters  (?v3 ?v2)
       :precondition (and (not-eq ?v3 ?v2) 
                          (pred_2 ?v3) (pred_2 ?v2) (pred_6 ?v3))
       :effect (and  (pred_6 ?v2)
		     (not (pred_6 ?v3))))


   (:action op_1
       :parameters (?v5 ?v8)
       :precondition  (and  (pred_5 ?v5) (pred_2 ?v8)
			    (pred_1 ?v5 ?v8) (pred_6 ?v8) (pred_3))
       :effect (and (pred_4 ?v5)
		    (not (pred_1 ?v5 ?v8)) 
		    (not (pred_3))))

   (:action op_2
       :parameters  (?v5  ?v8)
       :precondition  (and  (pred_5 ?v5) (pred_2 ?v8)
			    (pred_4 ?v5) (pred_6 ?v8))
       :effect (and (pred_1 ?v5 ?v8)
		    (pred_3)
		    (not (pred_4 ?v5)))))
