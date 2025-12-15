(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v3 ?v4)
		(pred_3 ?v2)
		(pred_1 ?v7)
		(pred_6 ?v7)
		(pred_5 ?v2 ?v7)
		(pred_2)
		(pred_4 ?v2))

   (:action op_2
       :parameters  (?v5 ?v1)
       :precondition (and (not-eq ?v5 ?v1) 
                          (pred_1 ?v5) (pred_1 ?v1) (pred_6 ?v5))
       :effect (and  (pred_6 ?v1)
		     (not (pred_6 ?v5))))


   (:action op_1
       :parameters (?v6 ?v8)
       :precondition  (and  (pred_3 ?v6) (pred_1 ?v8)
			    (pred_5 ?v6 ?v8) (pred_6 ?v8) (pred_2))
       :effect (and (pred_4 ?v6)
		    (not (pred_5 ?v6 ?v8)) 
		    (not (pred_2))))

   (:action op_3
       :parameters  (?v6  ?v8)
       :precondition  (and  (pred_3 ?v6) (pred_1 ?v8)
			    (pred_4 ?v6) (pred_6 ?v8))
       :effect (and (pred_5 ?v6 ?v8)
		    (pred_2)
		    (not (pred_4 ?v6)))))
