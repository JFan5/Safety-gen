(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v1 ?v4)
		(pred_5 ?v3)
		(pred_1 ?v7)
		(pred_3 ?v7)
		(pred_4 ?v3 ?v7)
		(pred_6)
		(pred_2 ?v3))

   (:action op_3
       :parameters  (?v2 ?v8)
       :precondition (and (not-eq ?v2 ?v8) 
                          (pred_1 ?v2) (pred_1 ?v8) (pred_3 ?v2))
       :effect (and  (pred_3 ?v8)
		     (not (pred_3 ?v2))))


   (:action op_2
       :parameters (?v6 ?v5)
       :precondition  (and  (pred_5 ?v6) (pred_1 ?v5)
			    (pred_4 ?v6 ?v5) (pred_3 ?v5) (pred_6))
       :effect (and (pred_2 ?v6)
		    (not (pred_4 ?v6 ?v5)) 
		    (not (pred_6))))

   (:action op_1
       :parameters  (?v6  ?v5)
       :precondition  (and  (pred_5 ?v6) (pred_1 ?v5)
			    (pred_2 ?v6) (pred_3 ?v5))
       :effect (and (pred_4 ?v6 ?v5)
		    (pred_6)
		    (not (pred_2 ?v6)))))
