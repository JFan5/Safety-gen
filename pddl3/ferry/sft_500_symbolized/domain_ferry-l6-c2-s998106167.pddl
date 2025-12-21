(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v5 ?v7)
		(pred_3 ?v6)
		(pred_2 ?v1)
		(pred_4 ?v1)
		(pred_6 ?v6 ?v1)
		(pred_5)
		(pred_1 ?v6))

   (:action op_2
       :parameters  (?v3 ?v4)
       :precondition (and (not-eq ?v3 ?v4) 
                          (pred_2 ?v3) (pred_2 ?v4) (pred_4 ?v3))
       :effect (and  (pred_4 ?v4)
		     (not (pred_4 ?v3))))


   (:action op_1
       :parameters (?v2 ?v8)
       :precondition  (and  (pred_3 ?v2) (pred_2 ?v8)
			    (pred_6 ?v2 ?v8) (pred_4 ?v8) (pred_5))
       :effect (and (pred_1 ?v2)
		    (not (pred_6 ?v2 ?v8)) 
		    (not (pred_5))))

   (:action op_3
       :parameters  (?v2  ?v8)
       :precondition  (and  (pred_3 ?v2) (pred_2 ?v8)
			    (pred_1 ?v2) (pred_4 ?v8))
       :effect (and (pred_6 ?v2 ?v8)
		    (pred_5)
		    (not (pred_1 ?v2)))))
