(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v7 ?v1)
		(pred_4 ?v2)
		(pred_1 ?v5)
		(pred_5 ?v5)
		(pred_2 ?v2 ?v5)
		(pred_6)
		(pred_3 ?v2))

   (:action op_3
       :parameters  (?v3 ?v4)
       :precondition (and (not-eq ?v3 ?v4) 
                          (pred_1 ?v3) (pred_1 ?v4) (pred_5 ?v3))
       :effect (and  (pred_5 ?v4)
		     (not (pred_5 ?v3))))


   (:action op_2
       :parameters (?v6 ?v8)
       :precondition  (and  (pred_4 ?v6) (pred_1 ?v8)
			    (pred_2 ?v6 ?v8) (pred_5 ?v8) (pred_6))
       :effect (and (pred_3 ?v6)
		    (not (pred_2 ?v6 ?v8)) 
		    (not (pred_6))))

   (:action op_1
       :parameters  (?v6  ?v8)
       :precondition  (and  (pred_4 ?v6) (pred_1 ?v8)
			    (pred_3 ?v6) (pred_5 ?v8))
       :effect (and (pred_2 ?v6 ?v8)
		    (pred_6)
		    (not (pred_3 ?v6)))))
