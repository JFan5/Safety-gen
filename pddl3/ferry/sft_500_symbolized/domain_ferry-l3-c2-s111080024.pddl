(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v4 ?v1)
		(pred_3 ?v3)
		(pred_4 ?v5)
		(pred_2 ?v5)
		(pred_6 ?v3 ?v5)
		(pred_5)
		(pred_1 ?v3))

   (:action op_3
       :parameters  (?v2 ?v6)
       :precondition (and (not-eq ?v2 ?v6) 
                          (pred_4 ?v2) (pred_4 ?v6) (pred_2 ?v2))
       :effect (and  (pred_2 ?v6)
		     (not (pred_2 ?v2))))


   (:action op_1
       :parameters (?v7 ?v8)
       :precondition  (and  (pred_3 ?v7) (pred_4 ?v8)
			    (pred_6 ?v7 ?v8) (pred_2 ?v8) (pred_5))
       :effect (and (pred_1 ?v7)
		    (not (pred_6 ?v7 ?v8)) 
		    (not (pred_5))))

   (:action op_2
       :parameters  (?v7  ?v8)
       :precondition  (and  (pred_3 ?v7) (pred_4 ?v8)
			    (pred_1 ?v7) (pred_2 ?v8))
       :effect (and (pred_6 ?v7 ?v8)
		    (pred_5)
		    (not (pred_1 ?v7)))))
