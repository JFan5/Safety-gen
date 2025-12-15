(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v6 ?v4)
		(pred_2 ?v7)
		(pred_6 ?v3)
		(pred_4 ?v3)
		(pred_1 ?v7 ?v3)
		(pred_5)
		(pred_3 ?v7))

   (:action op_1
       :parameters  (?v2 ?v8)
       :precondition (and (not-eq ?v2 ?v8) 
                          (pred_6 ?v2) (pred_6 ?v8) (pred_4 ?v2))
       :effect (and  (pred_4 ?v8)
		     (not (pred_4 ?v2))))


   (:action op_2
       :parameters (?v1 ?v5)
       :precondition  (and  (pred_2 ?v1) (pred_6 ?v5)
			    (pred_1 ?v1 ?v5) (pred_4 ?v5) (pred_5))
       :effect (and (pred_3 ?v1)
		    (not (pred_1 ?v1 ?v5)) 
		    (not (pred_5))))

   (:action op_3
       :parameters  (?v1  ?v5)
       :precondition  (and  (pred_2 ?v1) (pred_6 ?v5)
			    (pred_3 ?v1) (pred_4 ?v5))
       :effect (and (pred_1 ?v1 ?v5)
		    (pred_5)
		    (not (pred_3 ?v1)))))
