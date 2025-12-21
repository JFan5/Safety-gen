(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v3 ?v1)
		(pred_6 ?v7)
		(pred_4 ?v4)
		(pred_3 ?v4)
		(pred_1 ?v7 ?v4)
		(pred_5)
		(pred_2 ?v7))

   (:action op_2
       :parameters  (?v5 ?v6)
       :precondition (and (not-eq ?v5 ?v6) 
                          (pred_4 ?v5) (pred_4 ?v6) (pred_3 ?v5))
       :effect (and  (pred_3 ?v6)
		     (not (pred_3 ?v5))))


   (:action op_1
       :parameters (?v2 ?v8)
       :precondition  (and  (pred_6 ?v2) (pred_4 ?v8)
			    (pred_1 ?v2 ?v8) (pred_3 ?v8) (pred_5))
       :effect (and (pred_2 ?v2)
		    (not (pred_1 ?v2 ?v8)) 
		    (not (pred_5))))

   (:action op_3
       :parameters  (?v2  ?v8)
       :precondition  (and  (pred_6 ?v2) (pred_4 ?v8)
			    (pred_2 ?v2) (pred_3 ?v8))
       :effect (and (pred_1 ?v2 ?v8)
		    (pred_5)
		    (not (pred_2 ?v2)))))
