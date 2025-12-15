(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v7 ?v1)
		(pred_2 ?v4)
		(pred_3 ?v6)
		(pred_4 ?v6)
		(pred_6 ?v4 ?v6)
		(pred_5)
		(pred_1 ?v4))

   (:action op_2
       :parameters  (?v2 ?v5)
       :precondition (and (not-eq ?v2 ?v5) 
                          (pred_3 ?v2) (pred_3 ?v5) (pred_4 ?v2))
       :effect (and  (pred_4 ?v5)
		     (not (pred_4 ?v2))))


   (:action op_3
       :parameters (?v3 ?v8)
       :precondition  (and  (pred_2 ?v3) (pred_3 ?v8)
			    (pred_6 ?v3 ?v8) (pred_4 ?v8) (pred_5))
       :effect (and (pred_1 ?v3)
		    (not (pred_6 ?v3 ?v8)) 
		    (not (pred_5))))

   (:action op_1
       :parameters  (?v3  ?v8)
       :precondition  (and  (pred_2 ?v3) (pred_3 ?v8)
			    (pred_1 ?v3) (pred_4 ?v8))
       :effect (and (pred_6 ?v3 ?v8)
		    (pred_5)
		    (not (pred_1 ?v3)))))
