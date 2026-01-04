(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v1 ?v3)
		(pred_2 ?v6)
		(pred_6 ?v7)
		(pred_3 ?v7)
		(pred_4 ?v6 ?v7)
		(pred_5)
		(pred_1 ?v6))

   (:action op_2
       :parameters  (?v2 ?v5)
       :precondition (and (not-eq ?v2 ?v5) 
                          (pred_6 ?v2) (pred_6 ?v5) (pred_3 ?v2))
       :effect (and  (pred_3 ?v5)
		     (not (pred_3 ?v2))))


   (:action op_3
       :parameters (?v8 ?v4)
       :precondition  (and  (pred_2 ?v8) (pred_6 ?v4)
			    (pred_4 ?v8 ?v4) (pred_3 ?v4) (pred_5))
       :effect (and (pred_1 ?v8)
		    (not (pred_4 ?v8 ?v4)) 
		    (not (pred_5))))

   (:action op_1
       :parameters  (?v8  ?v4)
       :precondition  (and  (pred_2 ?v8) (pred_6 ?v4)
			    (pred_1 ?v8) (pred_3 ?v4))
       :effect (and (pred_4 ?v8 ?v4)
		    (pred_5)
		    (not (pred_1 ?v8)))))
