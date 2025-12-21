(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v7 ?v8)
		(pred_3 ?v6)
		(pred_1 ?v4)
		(pred_4 ?v4)
		(pred_6 ?v6 ?v4)
		(pred_5)
		(pred_2 ?v6))

   (:action op_1
       :parameters  (?v5 ?v1)
       :precondition (and (not-eq ?v5 ?v1) 
                          (pred_1 ?v5) (pred_1 ?v1) (pred_4 ?v5))
       :effect (and  (pred_4 ?v1)
		     (not (pred_4 ?v5))))


   (:action op_3
       :parameters (?v2 ?v3)
       :precondition  (and  (pred_3 ?v2) (pred_1 ?v3)
			    (pred_6 ?v2 ?v3) (pred_4 ?v3) (pred_5))
       :effect (and (pred_2 ?v2)
		    (not (pred_6 ?v2 ?v3)) 
		    (not (pred_5))))

   (:action op_2
       :parameters  (?v2  ?v3)
       :precondition  (and  (pred_3 ?v2) (pred_1 ?v3)
			    (pred_2 ?v2) (pred_4 ?v3))
       :effect (and (pred_6 ?v2 ?v3)
		    (pred_5)
		    (not (pred_2 ?v2)))))
